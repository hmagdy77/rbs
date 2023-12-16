// To parse this JSON data, do
//
//     final workModel = workModelFromJson(jsonString);

import 'dart:convert';

WorkModel workModelFromJson(String str) => WorkModel.fromJson(json.decode(str));

String workModelToJson(WorkModel data) => json.encode(data.toJson());

class WorkModel {
  String status;
  List<Work> data;

  WorkModel({
    required this.status,
    required this.data,
  });

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        status: json["status"],
        data: List<Work>.from(json["data"].map((x) => Work.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Work {
  int workId;
  DateTime workStart;
  DateTime workEnd;
  int workClosed;
  String workName;
  String workTotal;
  String workPayment;

  Work({
    required this.workId,
    required this.workStart,
    required this.workEnd,
    required this.workClosed,
    required this.workName,
    required this.workTotal,
    required this.workPayment,
  });

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        workId: json["work_id"],
        workStart: DateTime.parse(json["work_start"]),
        workEnd: DateTime.parse(json["work_end"]),
        workClosed: json["work_closed"],
        workName: json["work_name"],
        workTotal: json["work_total"],
        workPayment: json["work_payment"],
      );

  Map<String, dynamic> toJson() => {
        "work_id": workId,
        "work_start": workStart.toIso8601String(),
        "work_end": workEnd.toIso8601String(),
        "work_closed": workClosed,
        "work_name": workName,
        "work_total": workTotal,
        "work_payment": workPayment,
      };
}
