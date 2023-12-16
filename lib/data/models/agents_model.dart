// To parse this JSON data, do
//
//     final agentsModel = agentsModelFromJson(jsonString);

import 'dart:convert';

AgentsModel agentsModelFromJson(String str) =>
    AgentsModel.fromJson(json.decode(str));

String agentsModelToJson(AgentsModel data) => json.encode(data.toJson());

class AgentsModel {
  String status;
  List<Agent> data;

  AgentsModel({
    required this.status,
    required this.data,
  });

  factory AgentsModel.fromJson(Map<String, dynamic> json) => AgentsModel(
        status: json["status"],
        data: List<Agent>.from(json["data"].map((x) => Agent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Agent {
  String id;
  String name;
  String phone1;
  String phone2;
  String reports;
  String reportsDone;
  String fbPosts;
  String fbRells;
  String fbStorys;
  String fbVideos;
  String insPosts;
  String insRells;
  String insStorys;
  String insVideos;
  String insHighlight;
  String wbBlog;
  String wbPhotos;
  String wbVideos;
  String ytShorts;
  String ytVideos;
  String dsFrame;
  String dsCover;
  String dsPosts;
  String active;
  String account;
  String image;
  DateTime renewalDate;
  String renewalValue;

  Agent({
    required this.id,
    required this.name,
    required this.phone1,
    required this.phone2,
    required this.reports,
    required this.reportsDone,
    required this.fbPosts,
    required this.fbRells,
    required this.fbStorys,
    required this.fbVideos,
    required this.insPosts,
    required this.insRells,
    required this.insStorys,
    required this.insVideos,
    required this.insHighlight,
    required this.wbBlog,
    required this.wbPhotos,
    required this.wbVideos,
    required this.ytShorts,
    required this.ytVideos,
    required this.dsFrame,
    required this.dsCover,
    required this.dsPosts,
    required this.active,
    required this.image,
    required this.account,
    required this.renewalDate,
    required this.renewalValue,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        id: json["id"],
        name: json["name"],
        phone1: json["phone1"],
        phone2: json["phone2"],
        reports: json["reports"],
        reportsDone: json["reports_done"],
        fbPosts: json["fb_posts"],
        fbRells: json["fb_rells"],
        fbStorys: json["fb_storys"],
        fbVideos: json["fb_videos"],
        insPosts: json["ins_posts"],
        insRells: json["ins_rells"],
        insStorys: json["ins_storys"],
        insVideos: json["ins_videos"],
        insHighlight: json["ins_highlight"],
        wbBlog: json["wb_blog"],
        wbPhotos: json["wb_photos"],
        wbVideos: json["wb_videos"],
        ytShorts: json["yt_shorts"],
        ytVideos: json["yt_videos"],
        dsFrame: json["ds_frame"],
        dsCover: json["ds_cover"],
        dsPosts: json["ds_posts"],
        active: json["active"],
        account: json["account"],
        image: json["image"],
        renewalDate: DateTime.parse(json["renewal_date"]),
        renewalValue: json["renewal_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone1": phone1,
        "phone2": phone2,
        "reports": reports,
        "reports_done": reportsDone,
        "fb_posts": fbPosts,
        "fb_rells": fbRells,
        "fb_storys": fbStorys,
        "fb_videos": fbVideos,
        "ins_posts": insPosts,
        "ins_rells": insRells,
        "ins_storys": insStorys,
        "ins_videos": insVideos,
        "ins_highlight": insHighlight,
        "wb_blog": wbBlog,
        "wb_photos": wbPhotos,
        "wb_videos": wbVideos,
        "yt_shorts": ytShorts,
        "yt_videos": ytVideos,
        "ds_frame": dsFrame,
        "ds_cover": dsCover,
        "ds_posts": dsPosts,
        "active": active,
        "account": account,
        "image": image,
        "renewal_date": renewalDate,
        "renewal_value": renewalValue
      };
}
