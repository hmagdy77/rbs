import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../libraries.dart';

class AttendController extends GetxController {}

class AttendControllerImp extends AttendController {
  // List<Attend> attendToDay = [];
  List<Attend> dayAttend = [];
  List<Attend> rangedAttend = [];

  var formatter = DateFormat('yyyy-MM-dd');
  var isLoading = false.obs;
  String selectedDate = '';
  String startDate = '';
  String endDate = '';
  String endDateSend = '';

  viewAttend({required DateTime date}) async {
    isLoading(true);
    update();
    try {
      var addCampaginRepo = await AttendRepo.logToday(
        day: formatter.format(date),
      );
      if (addCampaginRepo.status == 'suc') {
        dayAttend.clear();
        dayAttend.addAll(addCampaginRepo.data);

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

  changeDate({required DateTime date, required String kind}) {
    isLoading(true);
    update();
    if (kind == '1') {
      selectedDate = formatter.format(date);
      isLoading(false);
      update();
    } else if (kind == '2') {
      startDate = formatter.format(date);
      isLoading(false);
      update();
    } else {
      endDate = formatter.format(date);
      endDateSend =
          '${date.year}-${date.month}-${date.day} 11:59:59'; //dateFormatter.format(date);
      isLoading(false);
      update();
    }
  }

  getAttendfromRange({required String name}) async {
    isLoading(true);
    update();

    try {
      var attend = await AttendRepo.logMonth(
        name: name,
        start: startDate,
        end: endDateSend,
      );
      if (attend.status == 'suc') {
        rangedAttend.clear();
        rangedAttend.addAll(attend.data);
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
}
