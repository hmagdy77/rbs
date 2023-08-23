import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../data/repo/repo_alerts.dart';
import '../../libraries.dart';
part 'alerts_state.dart';

class AlertsCubit extends Cubit<AlertsState> {
  AlertsCubit() : super(AlertsInit());
  List<Alert> allAlerts = [];
  List<Alert> alerts = [];
  List<Alert> newAlerts = [];
  List<Alert> ideas = [];
  var formatter = DateFormat('yyyy-MM-dd');
  TextEditingController content = TextEditingController();
  TextEditingController title = TextEditingController();
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
    emit(AlertsLoading());
    try {
      var addAlertRepo = await AlertsRepo.addAlerts(
        content: content.text,
        title: title.text,
        agent: agent,
        creater: creater,
        kind: kind,
      );
      if (addAlertRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(AlertsChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(AlertsFail());
      }
    } catch (e) {
      emit(AlertsError());
      showSnak(context: context, type: 0);
    }
  }

  getAlerts() async {
    emit(AlertsLoading());
    try {
      var alerts = await AlertsRepo.viewAlerts();
      if (alerts.status == 'suc') {
        allAlerts.clear();
        allAlerts.addAll(alerts.data);
        sortAlerts();
        emit(AlertsSucsses());
      } else {
        emit(AlertsError());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
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
        // emit(AlertsLoading());
        try {
          var deleteAlert = await AlertsRepo.deleteAlerts(id: id);
          if (deleteAlert.status == 'suc') {
            showSnak(context: context, type: 1);
            // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
            emit(AlertsChanged());
          } else {
            showSnak(context: context, type: 0);
            emit(AlertsFail());
          }
        } catch (e) {
          showSnak(context: context, type: 0);
          emit(AlertsError());
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
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(AlertsChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(AlertsFail());
      }
    } catch (e) {
      emit(AlertsError());
      showSnak(context: context, type: 0);
    }
  }
}
