import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../libraries.dart';

class StaticsController extends GetxController {}

class StaticsControllerImp extends StaticsController {
  List<Statics> allStaticss = [];
  List<Statics> campaginStaticss = [];
  var formatter = DateFormat('yyyy-MM-dd');
  List<List<String>> printItems = [];

  TextEditingController messages = TextEditingController();
  TextEditingController comments = TextEditingController();
  TextEditingController likes = TextEditingController();
  TextEditingController reach = TextEditingController();
  int commentsSum = 0;
  int likesSum = 0;
  int messagesSum = 0;
  int reachSum = 0;
  var isLoading = false.obs;

  @override
  void onInit() {
    getStaticss();
    super.onInit();
  }

  void showDialog({required Widget child, context}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: AppSizes.h6,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  addStatics({
    required String campaignId,
    required context,
    required String byEmp,
  }) async {
    isLoading(true);
    update();

    try {
      var addStaticsRepo = await StaticsRepo.addStatics(
        campaignId: campaignId,
        byEmp: byEmp,
        messages: (int.parse(messages.text) - messagesSum).toString(),
        reach: (int.parse(reach.text) - reachSum).toString(),
        comments: (int.parse(comments.text) - commentsSum).toString(),
        likes: (int.parse(likes.text) - likesSum).toString(),
      );
      if (addStaticsRepo.status == 'suc') {
        MySnackBar.snack(AppStrings.done, 'message');
        clearTextFields();
        await getStaticss();
        isLoading(false);
        update();
      } else {
        MySnackBar.snack(AppStrings.faild, 'message');
        isLoading(false);
        update();
      }
    } catch (e) {
      isLoading(false);
      update();
      MySnackBar.snack(AppStrings.faild, 'message');
    }
  }

  getStaticss() async {
    isLoading(true);
    update();
    try {
      var staticss = await StaticsRepo.viewStatics();
      if (staticss.status == 'suc') {
        allStaticss.clear();
        allStaticss.addAll(staticss.data);
        // sortStaticss(camaginId: int.parse(camaginId));
        isLoading(false);
        update();
      } else {
        isLoading(false);
        update();
      }
    } catch (e) {
      isLoading(false);
      update();
    }
  }

  sortStaticss({required int camaginId}) async {
    campaginStaticss.clear();
    campaginStaticss = allStaticss
        .where(
          (statics) {
            int id = int.parse(statics.campaignId);
            return id == camaginId;
          },
        )
        .toList()
        .reversed
        .toList();
    sum(staticsList: campaginStaticss);
  }

  prepareTextFields({required Statics statics}) {
    messages.text = statics.messages;
    comments.text = statics.comments;
    likes.text = statics.likes;
    reach.text = statics.reach;
  }

  clearTextFields() {
    messages.clear();
    comments.clear();
    likes.clear();
    reach.clear();
  }

  editStaticse({required Statics statics, required context}) async {
    isLoading(true);
    update();
    try {
      var editStaticsRepo = await StaticsRepo.editStatics(
        id: statics.id,
        messages: messages.text,
        reach: reach.text,
        comments: comments.text,
        likes: likes.text,
      );
      if (editStaticsRepo.status == 'suc') {
        MySnackBar.snack(AppStrings.done, 'message');
        await getStaticss();
        isLoading(false);
        update();
      } else {
        MySnackBar.snack(AppStrings.faild, 'message');
        isLoading(false);
        update();
      }
    } catch (e) {
      MySnackBar.snack(AppStrings.faild, 'message');
      isLoading(false);
      update();
    }
  }

  deleteStatics({required String id, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        isLoading(true);
        update();
        try {
          var deleteStaticsRepo = await StaticsRepo.deleteStatics(id: id);
          if (deleteStaticsRepo.status == 'suc') {
            MySnackBar.snack(AppStrings.done, 'message');
            await getStaticss();
            isLoading(false);
            update();
          } else {
            MySnackBar.snack(AppStrings.faild, 'message');
            isLoading(false);
            update();
          }
        } catch (e) {
          MySnackBar.snack(AppStrings.faild, 'message');
          isLoading(false);
          update();
        }
      },
    );
  }

  sum({required List<Statics> staticsList}) {
    commentsSum = 0;
    likesSum = 0;
    messagesSum = 0;
    reachSum = 0;
    for (int i = 0; i < staticsList.length; i++) {
      commentsSum += int.parse(staticsList[i].comments);
      likesSum += int.parse(staticsList[i].likes);
      messagesSum += int.parse(staticsList[i].messages);
      reachSum += int.parse(staticsList[i].reach);
    }
  }
}
