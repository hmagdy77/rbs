import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../libraries.dart';

class CampaginsController extends GetxController {}

class CampaginsControllerImp extends CampaginsController {
  List<Campagin> allCampagins = [];
  List<Campagin> agentCampagins = [];
  var formatter = DateFormat('yyyy-MM-dd');
  var startDate = ''.obs;
  var endDate = ''.obs;
  int active = 1;
  TextEditingController name = TextEditingController();
  TextEditingController link = TextEditingController();
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getCampagins();
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

  // changeState() {
  //   isLoading(false);
  //  update();
  // }

  addCampagin({required String agentName, required context}) async {
    isLoading(true);
    update();
    try {
      var addCampaginRepo = await CampaginsRepo.addCampagin(
        name: name.text,
        agentId: agentName,
        link: link.text,
        active: '1',
        startDate: startDate.value,
        endDate: endDate.value,
      );

      if (addCampaginRepo.status == 'suc') {
        MySnackBar.snack(AppStrings.done, 'message');
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        await getCampagins();
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

  getCampagins() async {
    isLoading(true);
    update();
    try {
      var campagins = await CampaginsRepo.viewCampagin();
      if (campagins.status == 'suc') {
        allCampagins.clear();
        allCampagins.addAll(campagins.data);
        sortActiveCampagins();
        isLoading(false);
        update();
      } else {
        isLoading(false);
        update();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  sortCampagins({required int id}) async {
    agentCampagins.clear();
    agentCampagins = allCampagins
        .where(
          (campagin) {
            int campagins = int.parse(campagin.agentId);
            return campagins == id;
          },
        )
        .toList()
        .reversed
        .toList();
  }

  sortActiveCampagins() async {
    agentCampagins.clear();
    agentCampagins = allCampagins
        .where(
          (campagin) {
            int campagins = int.parse(campagin.active);
            return campagins == 1;
          },
        )
        .toList()
        .reversed
        .toList();
  }

  prepareTextFields({required Campagin campagin}) {
    name.text = campagin.name;
    link.text = campagin.link;
    // startDate = campagin.startDate;
    // endDate = campagin.endDate;
  }

  clearTextFields() {
    name.clear();
    link.clear();
    startDate.value = '';
    endDate.value = '';
  }

  editCampagine({
    required context,
    required Campagin campagin,
  }) async {
    isLoading(true);
    update();
    try {
      var editCampaginRepo = await CampaginsRepo.editCampagin(
        id: campagin.id,
        name: name.text,
        agentId: campagin.agentId,
        link: link.text,
        startDate: campagin.startDate, // '00:00:00 $startDate',
        endDate: campagin.endDate, // '00:00:00 $endDate',
      );
      if (editCampaginRepo.status == 'suc') {
        MySnackBar.snack(AppStrings.done, 'message');
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        await getCampagins();
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

  deleteCampagin({required String id, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        isLoading(true);
        update();
        try {
          var deleteCampaginRepo = await CampaginsRepo.deleteCampagin(
            id: id,
          );
          if (deleteCampaginRepo.status == 'suc') {
            MySnackBar.snack(AppStrings.done, 'message');
            // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
            await getCampagins();
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
      },
    );
  }

  activeCampagin({required String id, required String active}) async {
    {
      try {
        var actAgentRepo = await CampaginsRepo.activeCampagin(
          id: id,
          active: active,
        );
        if (actAgentRepo.status == 'suc') {
          MySnackBar.snack(AppStrings.done, 'message');
          await getCampagins();
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
  }
}
