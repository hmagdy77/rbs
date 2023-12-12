// To parse this JSON data, do
//
//     final alertsModel = alertsModelFromJson(jsonString);

import 'dart:convert';

AlertsModel alertsModelFromJson(String str) => AlertsModel.fromJson(json.decode(str));

String alertsModelToJson(AlertsModel data) => json.encode(data.toJson());

class AlertsModel {
    String status;
    List<Alert> data;

    AlertsModel({
        required this.status,
        required this.data,
    });

    factory AlertsModel.fromJson(Map<String, dynamic> json) => AlertsModel(
        status: json["status"],
        data: List<Alert>.from(json["data"].map((x) => Alert.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Alert {
    String id;
    String title;
    String content;
    String creater;
    String reciver;
    String seen;
    String agent;
    DateTime createdAt;
    DateTime seenAt;

    Alert({
        required this.id,
        required this.title,
        required this.content,
        required this.creater,
        required this.reciver,
        required this.seen,
        required this.agent,
        required this.createdAt,
        required this.seenAt,
    });

    factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        creater: json["creater"],
        reciver: json["reciver"],
        seen: json["seen"],
        agent: json["agent"],
        createdAt: DateTime.parse(json["created_at"]),
        seenAt: DateTime.parse(json["seen_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "creater": creater,
        "reciver": reciver,
        "seen": seen,
        "agent": agent,
        "created_at": createdAt.toIso8601String(),
        "seen_at": seenAt.toIso8601String(),
    };
}
