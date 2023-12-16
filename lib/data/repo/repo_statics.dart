import '../../../libraries.dart';

class StaticsRepo {
  static viewStatics() {
    return Crud.postRequest(
      url: Api.statisticsView,
      data: {},
      function: staticsModelFromJson,
    );
  }

  static addStatics({
    required String campaignId,
    required String byEmp,
    required String messages,
    required String reach,
    required String comments,
    required String likes,
  }) {
    return Crud.postRequest(
      url: Api.statisticsAdd,
      data: {
        "campaign_id": campaignId,
        'by_emp': byEmp,
        "messages": messages,
        "reach": reach,
        "comments": comments,
        "likes": likes,
      },
      function: statusModelFromJson,
    );
  }

  static editStatics({
    required String id,
    required String messages,
    required String reach,
    required String comments,
    required String likes,
  }) {
    return Crud.postRequest(
      url: Api.statisticsEdit,
      data: {
        "id": id,
        "messages": messages,
        "reach": reach,
        "comments": comments,
        "likes": likes,
      },
      function: statusModelFromJson,
    );
  }

  static deleteStatics({
    required String id,
  }) {
    return Crud.postRequest(
      url: Api.statisticsDelete,
      data: {
        "id": id,
      },
      function: statusModelFromJson,
    );
  }
}
