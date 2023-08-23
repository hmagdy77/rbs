// To parse this JSON data, do
//
//     final safeModel = safeModelFromJson(jsonString);

import 'dart:convert';

SafeModel safeModelFromJson(String str) => SafeModel.fromJson(json.decode(str));

String safeModelToJson(SafeModel data) => json.encode(data.toJson());

class SafeModel {
    String status;
    List<Safe> data;

    SafeModel({
        required this.status,
        required this.data,
    });

    factory SafeModel.fromJson(Map<String, dynamic> json) => SafeModel(
        status: json["status"],
        data: List<Safe>.from(json["data"].map((x) => Safe.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Safe {
    String value;

    Safe({
        required this.value,
    });

    factory Safe.fromJson(Map<String, dynamic> json) => Safe(
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
    };
}
