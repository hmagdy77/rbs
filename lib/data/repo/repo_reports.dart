import 'package:rbs/libraries.dart';

class ReportsRepo {
  static viewReport() {
    return Crud.postRequest(
      url: Api.reportsView,
      data: {},
      function: repoetsModelFromJson,
    );
  }

  static dateReports({
    required String start,
    required String end,
    required String agentId,
  }) {
    return Crud.postRequest(
      url: Api.reportsDate,
      data: {
        'start': start,
        'end': end,
        'agent_id': agentId,
      },
      function: repoetsModelFromJson,
    );
  }

  static addReport({
    required String agentId,
    required String byEmp,
    required String fbPosts,
    required String fbRells,
    required String fbStorys,
    required String fbVideos,
    required String insPosts,
    required String insRells,
    required String insStorys,
    required String insVideos,
    required String insHighlight,
    required String wbBlog,
    required String wbphotos,
    required String wbVideos,
    required String ytShorts,
    required String ytVideos,
    required String dsFrame,
    required String dsCover,
    required String dsPosts,
  }) {
    return Crud.postRequest(
      url: Api.reportsAdd,
      data: {
        'agent_id': agentId,
        'by_emp': byEmp,
        // Facebook
        'fb_posts': fbPosts, //1
        'fb_rells': fbRells, //2
        'fb_storys': fbStorys, //3
        'fb_videos': fbVideos, //4
        //instgram
        'ins_posts': insPosts, //5
        'ins_rells': insRells, //6
        'ins_storys': insStorys, //7
        'ins_videos': insVideos, //8
        'ins_highlight': insHighlight, //9
        // Website
        'wb_blog': wbBlog, //10
        'wb_photos': wbphotos, //11
        'wb_videos': wbVideos, //12
        //Youtube
        'yt_shorts': ytShorts, //14
        'yt_videos': ytVideos, //14
        //Design
        'ds_frame': dsFrame,
        'ds_cover': dsCover,
        'ds_posts': dsPosts,
      },
      function: statusModelFromJson,
    );
  }

  static editReport({
    required String id,
    required String agentId,
    required String fbPosts,
    required String fbRells,
    required String fbStorys,
    required String fbVideos,
    required String insPosts,
    required String insRells,
    required String insStorys,
    required String insVideos,
    required String insHighlight,
    required String wbBlog,
    required String wbphotos,
    required String wbVideos,
    required String ytShorts,
    required String ytVideos,
    required String dsFrame,
    required String dsCover,
    required String dsPosts,
  }) {
    return Crud.postRequest(
      url: Api.reportsEdit,
      data: {
        'id': id,
        'agent_id': agentId,
        // Facebook
        'fb_posts': fbPosts,
        'fb_rells': fbRells,
        'fb_storys': fbStorys,
        'fb_videos': fbVideos,
        //instgram
        'ins_posts': insPosts,
        'ins_rells': insRells,
        'ins_storys': insStorys,
        'ins_videos': insVideos,
        'ins_highlight': insHighlight,
        // Website
        'wb_blog': wbBlog,
        'wb_photos': wbphotos,
        'wb_videos': wbVideos,
        //Youtube
        'yt_shorts': ytShorts,
        'yt_videos': ytVideos,
        //Design
        'ds_frame': dsFrame,
        'ds_cover': dsCover,
        'ds_posts': dsPosts,
      },
      function: statusModelFromJson,
    );
  }

  static deleteReport({
    required String id,
  }) {
    return Crud.postRequest(
      url: Api.reportsDelete,
      data: {
        'id': id,
      },
      function: statusModelFromJson,
    );
  }
}
