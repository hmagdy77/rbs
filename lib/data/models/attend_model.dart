// To parse this JSON data, do
//
//     final attendModel = attendModelFromJson(jsonString);

import 'dart:convert';

AttendModel attendModelFromJson(String str) => AttendModel.fromJson(json.decode(str));

String attendModelToJson(AttendModel data) => json.encode(data.toJson());

class AttendModel {
    String status;
    List<Attend> data;

    AttendModel({
        required this.status,
        required this.data,
    });

    factory AttendModel.fromJson(Map<String, dynamic> json) => AttendModel(
        status: json["status"],
        data: List<Attend>.from(json["data"].map((x) => Attend.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Attend {
    String dayId;
    String empName;
    DateTime day;
    DateTime empAttend;
    DateTime empExit;
    String isExit;
    String minutes;

    Attend({
        required this.dayId,
        required this.empName,
        required this.day,
        required this.empAttend,
        required this.empExit,
        required this.isExit,
        required this.minutes,
    });

    factory Attend.fromJson(Map<String, dynamic> json) => Attend(
        dayId: json["day_id"],
        empName: json["emp_name"],
        day: DateTime.parse(json["day"]),
        empAttend: DateTime.parse(json["emp_attend"]),
        empExit: DateTime.parse(json["emp_exit"]),
        isExit: json["is_exit"],
        minutes: json["minutes"],
    );

    Map<String, dynamic> toJson() => {
        "day_id": dayId,
        "emp_name": empName,
        "day": day.toIso8601String(),
        "emp_attend": empAttend.toIso8601String(),
        "emp_exit": empExit.toIso8601String(),
        "is_exit": isExit,
        "minutes": minutes,
    };
}
