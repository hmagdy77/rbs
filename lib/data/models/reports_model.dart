// To parse this JSON data, do
//
//     final repoetsModel = repoetsModelFromJson(jsonString);

import 'dart:convert';

RepoetsModel repoetsModelFromJson(String str) =>
    RepoetsModel.fromJson(json.decode(str));

String repoetsModelToJson(RepoetsModel data) => json.encode(data.toJson());

class RepoetsModel {
  String status;
  List<Report> data;

  RepoetsModel({
    required this.status,
    required this.data,
  });

  factory RepoetsModel.fromJson(Map<String, dynamic> json) => RepoetsModel(
        status: json["status"],
        data: List<Report>.from(json["data"].map((x) => Report.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Report {
  String id;
  String agentId;
  String byEmp;
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
  DateTime date;

  Report({
    required this.id,
    required this.agentId,
    required this.byEmp,
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
    required this.date,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        agentId: json["agent_id"],
        byEmp: json["by_emp"],
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
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "agent_id": agentId,
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
        "date": date.toIso8601String(),
      };
}
