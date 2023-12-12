// To parse this JSON data, do
//
//     final opreationModel = opreationModelFromJson(jsonString);

import 'dart:convert';

OpreationModel opreationModelFromJson(String str) =>
    OpreationModel.fromJson(json.decode(str));

String opreationModelToJson(OpreationModel data) => json.encode(data.toJson());

class OpreationModel {
  String status;
  List<Opreation> data;

  OpreationModel({
    required this.status,
    required this.data,
  });

  factory OpreationModel.fromJson(Map<String, dynamic> json) => OpreationModel(
        status: json["status"],
        data: List<Opreation>.from(
            json["data"].map((x) => Opreation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Opreation {
  String id;
  String agent;
  String price;
  String serviceName;
  String serviceDesc;
  String desc;
  String kind;
  DateTime time;

  Opreation({
    required this.id,
    required this.agent,
    required this.price,
    required this.serviceName,
    required this.serviceDesc,
    required this.desc,
    required this.kind,
    required this.time,
  });

  factory Opreation.fromJson(Map<String, dynamic> json) => Opreation(
        id: json["id"],
        agent: json["agent"],
        price: json["price"],
        serviceName: json["service_name"],
        serviceDesc: json["service_desc"],
        desc: json["desc"],
        kind: json["kind"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "agent": agent,
        "price": price,
        "service_name": serviceName,
        "service_desc": serviceDesc,
        "desc": desc,
        "kind": kind,
        "time": time.toIso8601String(),
      };
}
