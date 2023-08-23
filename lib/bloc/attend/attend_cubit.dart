import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../libraries.dart';
part 'attend_state.dart';

class AttendCubit extends Cubit<AttendState> {
  AttendCubit() : super(AttendInit());
  // List<Attend> attendToDay = [];
  List<Attend> dayAttend = [];
  List<Attend> rangedAttend = [];

  var formatter = DateFormat('yyyy-MM-dd');

  String selectedDate = '';
  String startDate = '';
  String endDate = '';
  String endDateSend = '';

  viewAttend({required DateTime date}) async {
    try {
      var addCampaginRepo = await AttendRepo.logToday(
        day: formatter.format(date),
      );
      if (addCampaginRepo.status == 'suc') {
        dayAttend.clear();
        dayAttend.addAll(addCampaginRepo.data);
        emit(AttendSucsses());
      } else {
        emit(AttendFail());
      }
    } catch (e) {
      emit(AttendError());
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
    if (kind == '1') {
      selectedDate = formatter.format(date);
      emit(AttendChanged());
    } else if (kind == '2') {
      startDate = formatter.format(date);
      emit(AttendChanged());
    } else {
      endDate = formatter.format(date);
      endDateSend =
          '${date.year}-${date.month}-${date.day} 11:59:59'; //dateFormatter.format(date);
      emit(AttendChanged());
    }
  }

  getAttendfromRange({required String name}) async {
    emit(AttendLoading());
    try {
      var attend = await AttendRepo.logMonth(
        name: name,
        start: startDate,
        end: endDateSend,
      );
      if (attend.status == 'suc') {
        rangedAttend.clear();
        rangedAttend.addAll(attend.data);
        emit(AttendSucsses());
      } else {
        emit(AttendFail());
      }
    } catch (e) {
      emit(AttendError());
    }
  }
}
