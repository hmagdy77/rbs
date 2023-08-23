import 'package:rbs/libraries.dart';

class AttendRepo {
  static attend({
    required String name,
    required String day,
    required String time,
  }) {
    return Crud.postRequest(
      url: Api.attendAttend,
      data: {
        'emp_name': name,
        'day': day,
        'emp_attend': time,
      },
      function: statusModelFromJson,
    );
  }

  static exit({
    required String name,
    required String day,
    required String time,
  }) {
    return Crud.postRequest(
      url: Api.attendExit,
      data: {
        'emp_name': name,
        'day': day,
        'emp_exit': time,
      },
      function: statusModelFromJson,
    );
  }

  static logToday({
    required String day,
  }) {
    return Crud.postRequest(
      url: Api.attendToday,
      data: {
        'day': day,
      },
      function: attendModelFromJson,
    );
  }

  static logMonth({
    required String name,
    required String start,
    required String end,
  }) {
    return Crud.postRequest(
      url: Api.attendLog,
      data: {
        'emp_name': name,
        'start': start,
        'end': end,
      },
      function: attendModelFromJson,
    );
  }
}
