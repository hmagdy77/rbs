import '../../libraries.dart';

class OperationsRepo {
  static viewOpreations() {
    return Crud.postRequest(
      url: Api.operationsView,
      data: {},
      function: opreationModelFromJson,
    );
  }

  static updateAgentAcc({
    required String id,
    required String account,
  }) {
    return Crud.postRequest(
      url: Api.updateAgentAcc,
      data: {
        'id': id,
        'account': account,
      },
      function: statusModelFromJson,
    );
  }

  static addOpreations({
    required String agent,
    required String price,
    required String serviceName,
    required String serviceDesc,
    required String desc,
    required String kind,
    required String time,
  }) {
    return Crud.postRequest(
      url: Api.operationsAdd,
      data: {
        'agent': agent,
        'price': price,
        'service_name': serviceName,
        'service_desc': serviceDesc,
        'desc': desc,
        'kind': kind,
        'time': time,
      },
      function: statusModelFromJson,
    );
  }

  static editOpreations({
    required String id,
    required String agent,
    required String price,
    required String serviceName,
    required String serviceDesc,
    required String desc,
    required String kind,
    required String time,
  }) {
    return Crud.postRequest(
      url: Api.operationsEdit,
      data: {
        'id': id,
        'agent': agent,
        'price': price,
        'service_name': serviceName,
        'service_desc': serviceDesc,
        'desc': desc,
        'kind': kind,
        'time': time,
      },
      function: statusModelFromJson,
    );
  }

  static deleteOpreations({
    required String id,
  }) {
    return Crud.postRequest(
      url: Api.operationsDelete,
      data: {
        'id': id,
      },
      function: statusModelFromJson,
    );
  }
}
// service
