import '../../libraries.dart';

class ServicesRepo {
  static viewServices() {
    return Crud.postRequest(
      url: Api.servicesView,
      data: {},
      function: serviceModelFromJson,
    );
  }

  static addServices({
    required String name,
    required String desc,
  }) {
    return Crud.postRequest(
      url: Api.servicesAdd,
      data: {
        'name': name,
        'desc': desc,
      },
      function: statusModelFromJson,
    );
  }

  static editServices({
    required String id,
    required String name,
    required String desc,
  }) {
    return Crud.postRequest(
      url: Api.servicesEdit,
      data: {
        'id': id,
        'name': name,
        'desc': desc,
      },
      function: statusModelFromJson,
    );
  }

  static deleteServices({
    required String id,
  }) {
    return Crud.postRequest(
      url: Api.servicesDelete,
      data: {
        'id': id,
      },
      function: statusModelFromJson,
    );
  }
}
// 
