import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../data/repo/repo_alerts.dart';
import '../../libraries.dart';

class AlertsController extends GetxController {}

class AlertsControllerImp extends AlertsController {
  List<Alert> allAlerts = [];
  List<Alert> alerts = [];
  List<Alert> newAlerts = [];
  List<Alert> ideas = [];
  var isLoading = false.obs;
  var formatter = DateFormat('yyyy-MM-dd');
  TextEditingController content = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  void onInit() {
    getAlerts();
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

  addAlert({
    required String agent,
    required String creater,
    required String kind,
    required context,
  }) async {
    isLoading(true);
    update();

    try {
      var addAlertRepo = await AlertsRepo.addAlerts(
        content: content.text,
        title: title.text,
        agent: agent,
        creater: creater,
        kind: kind,
      );
      if (addAlertRepo.status == 'suc') {
        await getAlerts();
        MySnackBar.snack(AppStrings.done, 'message');
        await UsersRepo.notification(
          title: creater,
          content: content.text,
          image: '',
        );
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

  getAlerts() async {
    isLoading(true);
    update();
    try {
      var alerts = await AlertsRepo.viewAlerts();
      if (alerts.status == 'suc') {
        allAlerts.clear();
        allAlerts.addAll(alerts.data);
        sortAlerts();
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

  sortAlerts() async {
    newAlerts.clear();
    ideas.clear();
    alerts.clear();
    alerts = allAlerts
        .where(
          (alert) {
            int seen = int.parse(alert.seen);
            return seen != 2;
          },
        )
        .toList()
        .reversed
        .toList();

    newAlerts = allAlerts
        .where(
          (alert) {
            int seen = int.parse(alert.seen);
            return seen == 0;
          },
        )
        .toList()
        .reversed
        .toList();
    ideas = allAlerts
        .where(
          (alert) {
            int seen = int.parse(alert.seen);
            return seen == 2;
          },
        )
        .toList()
        .reversed
        .toList();
  }

  deleteAlert({required String id, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        // isLoading(true);
        update();
        try {
          var deleteAlert = await AlertsRepo.deleteAlerts(id: id);
          if (deleteAlert.status == 'suc') {
            MySnackBar.snack(AppStrings.done, 'message');
            await getAlerts();

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

  makeSeen({
    required String reciver,
    required String id,
    required context,
  }) async {
    try {
      var seen = await AlertsRepo.makeSeen(
        id: id,
        reciver: reciver,
        seenAt: DateTime.now().toString(),
      );
      if (seen.status == 'suc') {
        await getAlerts();
        MySnackBar.snack(AppStrings.done, 'message');
        await UsersRepo.notification(
          title: reciver,
          content: 'تم استلام التتبيه',
          image: '',
        );
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
}
