// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  String status;
  List<Customer> data;

  CustomerModel({
    required this.status,
    required this.data,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        status: json["status"],
        data:
            List<Customer>.from(json["data"].map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Customer {
  int id;
  String name;
  String tel;
  String wts;
  String cash;
  String place;
  String address;
  String account;
  int kind;
  String other;

  Customer({
    required this.id,
    required this.name,
    required this.tel,
    required this.wts,
    required this.cash,
    required this.place,
    required this.address,
    required this.account,
    required this.kind,
    required this.other,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        tel: json["tel"],
        wts: json["wts"],
        cash: json["cash"],
        place: json["place"],
        address: json["address"],
        account: json["account"],
        kind: json["kind"],
        other: json["other"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tel": tel,
        "wts": wts,
        "cash": cash,
        "place": place,
        "address": address,
        "account": account,
        "kind": kind,
        "other": other,
      };
}
