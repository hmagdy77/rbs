// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

ServiceModel serviceModelFromJson(String str) =>
    ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  String status;
  List<ServiceM> data;

  ServiceModel({
    required this.status,
    required this.data,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        status: json["status"],
        data:
            List<ServiceM>.from(json["data"].map((x) => ServiceM.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ServiceM {
  String id;
  String name;
  String desc;

  ServiceM({
    required this.id,
    required this.name,
    required this.desc,
  });

  factory ServiceM.fromJson(Map<String, dynamic> json) => ServiceM(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
      };
}
