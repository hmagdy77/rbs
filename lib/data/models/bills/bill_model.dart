// To parse this JSON data, do
//
//     final billModel = billModelFromJson(jsonString);

import 'dart:convert';

BillModel billModelFromJson(String str) => BillModel.fromJson(json.decode(str));

String billModelToJson(BillModel data) => json.encode(data.toJson());

class BillModel {
  String status;
  List<Bill> data;

  BillModel({
    required this.status,
    required this.data,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
        status: json["status"],
        data: List<Bill>.from(json["data"].map((x) => Bill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Bill {
  int billId;
  String workNum;
  String workName;
  int kind;
  String customerAccount;
  int billItems;
  String billTotal;
  String billDiscount;
  String billAfterDiscount;
  String billPaid;
  String billUnpaid;
  String billPayment;
  String customerId;
  String customerName;
  String customerPhone;
  String billNotes;
  DateTime billTimestamp;

  Bill({
    required this.billId,
    required this.workNum,
    required this.workName,
    required this.kind,
    required this.customerAccount,
    required this.billItems,
    required this.billTotal,
    required this.billDiscount,
    required this.billAfterDiscount,
    required this.billPaid,
    required this.billUnpaid,
    required this.billPayment,
    required this.customerId,
    required this.customerName,
    required this.customerPhone,
    required this.billNotes,
    required this.billTimestamp,
  });

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        billId: json["bill_id"],
        workNum: json["work_num"],
        workName: json["work_name"],
        kind: json["kind"],
        customerAccount: json["customer_account"],
        billItems: json["bill_items"],
        billTotal: json["bill_total"],
        billDiscount: json["bill_discount"],
        billAfterDiscount: json["bill_after_discount"],
        billPaid: json["bill_paid"],
        billUnpaid: json["bill_unpaid"],
        billPayment: json["bill_payment"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        customerPhone: json["customer_phone"],
        billNotes: json["bill_notes"],
        billTimestamp: DateTime.parse(json["bill_timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "bill_id": billId,
        "work_num": workNum,
        "work_name": workName,
        "kind": kind,
        "customer_account": customerAccount,
        "bill_items": billItems,
        "bill_total": billTotal,
        "bill_discount": billDiscount,
        "bill_after_discount": billAfterDiscount,
        "bill_paid": billPaid,
        "bill_unpaid": billUnpaid,
        "bill_payment": billPayment,
        "customer_id": customerId,
        "customer_name": customerName,
        "customer_phone": customerPhone,
        "bill_notes": billNotes,
        "bill_timestamp": billTimestamp.toIso8601String(),
      };
}
