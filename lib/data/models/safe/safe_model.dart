// To parse this JSON data, do
//
//     final safeModel = safeModelFromJson(jsonString);

import 'dart:convert';

SafeModel safeModelFromJson(String str) => SafeModel.fromJson(json.decode(str));

String safeModelToJson(SafeModel data) => json.encode(data.toJson());

class SafeModel {
  String status;
  List<SafeVal> data;

  SafeModel({
    required this.status,
    required this.data,
  });

  factory SafeModel.fromJson(Map<String, dynamic> json) => SafeModel(
        status: json["status"],
        data: List<SafeVal>.from(json["data"].map((x) => SafeVal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SafeVal {
  String total;

  SafeVal({
    required this.total,
  });

  factory SafeVal.fromJson(Map<String, dynamic> json) => SafeVal(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
