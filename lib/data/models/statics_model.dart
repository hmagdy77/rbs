// To parse this JSON data, do
//
//     final staticsModel = staticsModelFromJson(jsonString);

import 'dart:convert';

StaticsModel staticsModelFromJson(String str) =>
    StaticsModel.fromJson(json.decode(str));

String staticsModelToJson(StaticsModel data) => json.encode(data.toJson());

class StaticsModel {
  String status;
  List<Statics> data;

  StaticsModel({
    required this.status,
    required this.data,
  });

  factory StaticsModel.fromJson(Map<String, dynamic> json) => StaticsModel(
        status: json["status"],
        data: List<Statics>.from(json["data"].map((x) => Statics.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Statics {
  String id;
  String byEmp;
  String campaignId;
  String messages;
  String reach;
  String comments;
  String likes;
  DateTime date;

  Statics({
    required this.id,
    required this.byEmp,
    required this.campaignId,
    required this.messages,
    required this.reach,
    required this.comments,
    required this.likes,
    required this.date,
  });

  factory Statics.fromJson(Map<String, dynamic> json) => Statics(
        id: json["id"],
        byEmp: json["by_emp"],
        campaignId: json["campaign_id"],
        messages: json["messages"],
        reach: json["reach"],
        comments: json["comments"],
        likes: json["likes"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "campaign_id": campaignId,
        "messages": messages,
        "reach": reach,
        "comments": comments,
        "likes": likes,
        "date": date.toIso8601String(),
      };
}
