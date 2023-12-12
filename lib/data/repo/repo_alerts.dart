import '../../libraries.dart';

class AlertsRepo {
  static viewAlerts() {
    return Crud.postRequest(
      url: Api.alertsView,
      data: {},
      function: alertsModelFromJson,
    );
  }

  static addAlerts({
    required String title,
    required String content,
    required String creater,
    required String agent,
    required String kind,
  }) {
    return Crud.postRequest(
      url: Api.alertsAdd,
      data: {
        "title": title,
        "content": content,
        "creater": creater,
        "agent": agent,
        "seen": kind,
      },
      function: statusModelFromJson,
    );
  }

  static deleteAlerts({
    required String id,
  }) {
    return Crud.postRequest(
      url: Api.alertsDelete,
      data: {
        "id": id,
      },
      function: statusModelFromJson,
    );
  }

  static makeSeen({
    required String reciver,
    required String seenAt,
    required String id,
  }) {
    return Crud.postRequest(
      url: Api.alertsSeen,
      data: {
        "reciver": reciver,
        "seen": '1',
        "seen_at": seenAt,
        "id": id,
      },
      function: statusModelFromJson,
    );
  }
}
