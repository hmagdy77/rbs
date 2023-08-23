// To parse this JSON data, do
//
//     final campaginsModel = campaginsModelFromJson(jsonString);

import 'dart:convert';

CampaginsModel campaginsModelFromJson(String str) =>
    CampaginsModel.fromJson(json.decode(str));

String campaginsModelToJson(CampaginsModel data) => json.encode(data.toJson());

class CampaginsModel {
  String status;
  List<Campagin> data;

  CampaginsModel({
    required this.status,
    required this.data,
  });

  factory CampaginsModel.fromJson(Map<String, dynamic> json) => CampaginsModel(
        status: json["status"],
        data:
            List<Campagin>.from(json["data"].map((x) => Campagin.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Campagin {
  String id;
  String agentId;
  String name;
  String image;
  String link;
  String active;
  DateTime startDate;
  DateTime endDate;

  Campagin({
    required this.id,
    required this.agentId,
    required this.name,
    required this.image,
    required this.link,
    required this.active,
    required this.startDate,
    required this.endDate,
  });

  factory Campagin.fromJson(Map<String, dynamic> json) => Campagin(
        id: json["id"],
        agentId: json["agent_id"],
        name: json["name"],
        image: json["image"],
        link: json["link"],
        active: json["active"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "agent_id": agentId,
        "name": name,
        "image": image,
        "link": link,
        "active": active,
        "start_date": startDate,
        "end_date": endDate,
      };
}
