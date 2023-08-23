import '../../libraries.dart';

class AgentsRepo {
  static viewAgent() {
    return Crud.postRequest(
      url: Api.agentsView,
      data: {},
      function: agentsModelFromJson,
    );
  }

  static viewSafe() {
    return Crud.postRequest(
      url: Api.viewSafe,
      data: {},
      function: safeModelFromJson,
    );
  }

  static updateSafe({required String value}) {
    return Crud.postRequest(
      url: Api.updateSafe,
      data: {
        'value': value,
      },
      function: statusModelFromJson,
    );
  }

  static addAgent({
    required List<int>? selectedFile,
    required String imageName,
    required String name,
    required String phone1,
    required String phone2,
    required String active,
    required String renewalDate,
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
    return Crud.postRequestWithFile(
      url: Api.agentsAdd,
      data: {
        'name': name,
        'phone1': phone1,
        'phone2': phone2,
        'active': active,
        'renewal_date': renewalDate,
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
      selectedFile: selectedFile,
      imageName: imageName,
      requestName: 'image',
    );
  }

  static editAgent({
    required String id,
    required String name,
    required String phone1,
    required String phone2,
    required String active,
    required String renewalDate,
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
      url: Api.agentsEdit,
      data: {
        'id': id,
        'name': name,
        'phone1': phone1,
        'phone2': phone2,
        'active': active,
        'renewal_date': renewalDate,
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

  static deleteAgent({
    required String id,
    required String image,
  }) {
    return Crud.postRequest(
      url: Api.agentsDelete,
      data: {
        'id': id,
        'image': image,
      },
      function: statusModelFromJson,
    );
  }

  static activeAgent({
    required String id,
    required String active,
  }) {
    return Crud.postRequest(
      url: Api.agentsActive,
      data: {
        'id': id,
        'active': active,
      },
      function: statusModelFromJson,
    );
  }
}
