// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  String status;
  List<Item> data;

  ItemModel({
    required this.status,
    required this.data,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        status: json["status"],
        data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Item {
  int itemId;
  String itemName;
  String itemNum;
  String itemSup;
  String itemPriceIn;
  String itemPriceOut;
  String itemCount;
  String billId;
  String itemQuant;
  String itemPriceOutAll;
  String itemSubQuant;
  String itemMin;
  String itemMax;
  String workId;
  int kind;
  String image;
  String itemExchange;
  String itemUsed;
  DateTime itemTime;

  Item({
    required this.itemId,
    required this.itemName,
    required this.itemNum,
    required this.itemSup,
    required this.itemPriceIn,
    required this.itemPriceOut,
    required this.itemCount,
    required this.billId,
    required this.itemQuant,
    required this.itemPriceOutAll,
    required this.itemSubQuant,
    required this.itemMin,
    required this.itemMax,
    required this.workId,
    required this.kind,
    required this.image,
    required this.itemExchange,
    required this.itemUsed,
    required this.itemTime,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["item_id"],
        itemName: json["item_name"],
        itemNum: json["item_num"],
        itemSup: json["item_sup"],
        itemPriceIn: json["item_price_in"],
        itemPriceOut: json["item_price_out"],
        itemCount: json["item_count"],
        billId: json["bill_id"],
        itemQuant: json["item_quant"],
        itemPriceOutAll: json["item_price_out_all"],
        itemSubQuant: json["item_sub_quant"],
        itemMin: json["item_min"],
        itemMax: json["item_max"],
        workId: json["work_id"],
        kind: json["kind"],
        image: json["image"],
        itemExchange: json["item_exchange"],
        itemUsed: json["item_used"],
        itemTime: DateTime.parse(json["item_time"]),
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "item_name": itemName,
        "item_num": itemNum,
        "item_sup": itemSup,
        "item_price_in": itemPriceIn,
        "item_price_out": itemPriceOut,
        "item_count": itemCount,
        "bill_id": billId,
        "item_quant": itemQuant,
        "item_price_out_all": itemPriceOutAll,
        "item_sub_quant": itemSubQuant,
        "item_min": itemMin,
        "item_max": itemMax,
        "work_id": workId,
        "kind": kind,
        "image": image,
        "item_exchange": itemExchange,
        "item_used": itemUsed,
        "item_time": itemTime.toIso8601String(),
      };
}
