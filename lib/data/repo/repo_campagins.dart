import 'package:rbs/libraries.dart';

class CampaginsRepo {
  static viewCampagin() {
    return Crud.postRequest(
      url: Api.campaginsView,
      data: {},
      function: campaginsModelFromJson,
    );
  }

  static addCampagin({
    required String name,
    required String agentId,
    required String link,
    required String active,
    required String startDate,
    required String endDate,
  }) {
    return Crud.postRequest(
      url: Api.campaginsAdd,
      data: {
        'name': name,
        'agent_id': agentId,
        'link': link,
        'active': active,
        'start_date': startDate,
        'end_date': endDate,
      },
      function: statusModelFromJson,
    );
  }

  static editCampagin({
    required String id,
    required String name,
    required String agentId,
    required String link,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return Crud.postRequest(
      url: Api.campaginsEdit,
      data: {
        'id': id,
        'name': name,
        'agent_id': agentId,
        'link': link,
        'start_date': startDate.toString(),
        'end_date': endDate.toString(),
      },
      function: statusModelFromJson,
    );
  }

  static deleteCampagin({
    required String id,
  }) {
    return Crud.postRequest(
      url: Api.campaginsDelete,
      data: {
        'id': id,
      },
      function: statusModelFromJson,
    );
  }

  static activeCampagin({
    required String id,
    required String active,
  }) {
    return Crud.postRequest(
      url: Api.campaginsActive,
      data: {
        'id': id,
        'active': active,
      },
      function: statusModelFromJson,
    );
  }
}
