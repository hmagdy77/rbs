import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../libraries.dart';
part 'statics_state.dart';

class StaticssCubit extends Cubit<StaticsState> {
  StaticssCubit() : super(StaticsInit());
  List<Statics> allStaticss = [];
  List<Statics> campaginStaticss = [];
  var formatter = DateFormat('yyyy-MM-dd');
  TextEditingController messages = TextEditingController();
  TextEditingController comments = TextEditingController();
  TextEditingController likes = TextEditingController();
  TextEditingController reach = TextEditingController();
  int commentsSum = 0;
  int likesSum = 0;
  int messagesSum = 0;
  int reachSum = 0;
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
    emit(StaticsLoading());
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
        showSnak(context: context, type: 1);
        clearTextFields();
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(StateChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(StateFail());
      }
    } catch (e) {
      emit(StateError());
      showSnak(context: context, type: 0);
    }
  }

  getStaticss({required String camaginId}) async {
    emit(StaticsLoading());
    try {
      var staticss = await StaticsRepo.viewStatics();
      if (staticss.status == 'suc') {
        allStaticss.clear();
        allStaticss.addAll(staticss.data);
        sortStaticss(camaginId: int.parse(camaginId));
        emit(StateSucsses());
      } else {
        emit(StateError());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
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
    emit(StaticsLoading());
    try {
      var editStaticsRepo = await StaticsRepo.editStatics(
        id: statics.id,
        messages: messages.text,
        reach: reach.text,
        comments: comments.text,
        likes: likes.text,
      );
      if (editStaticsRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(StateChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(StateFail());
      }
    } catch (e) {
      showSnak(context: context, type: 0);
      emit(StateError());
    }
  }

  deleteStatics({required String id, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        emit(StaticsLoading());
        try {
          var deleteStaticsRepo = await StaticsRepo.deleteStatics(id: id);
          if (deleteStaticsRepo.status == 'suc') {
            showSnak(context: context, type: 1);
            emit(StateChanged());
          } else {
            showSnak(context: context, type: 0);
            emit(StateFail());
          }
        } catch (e) {
          showSnak(context: context, type: 0);
          emit(StateError());
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
