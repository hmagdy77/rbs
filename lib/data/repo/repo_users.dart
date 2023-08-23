import 'package:rbs/libraries.dart';

class UsersRepo {
  static viewUsers() {
    return Crud.postRequest(
      url: Api.usersView,
      data: {},
      function: userModelFromJson,
    );
  }

  static addUser({
    required String userName,
    required String password,
    required String isAdmin,
    required String name,
  }) {
    return Crud.postRequest(
      url: Api.usersAdd,
      data: {
        'user_name': userName,
        'user_password': password,
        'user_admin': isAdmin,
        'emp': name,
      },
      function: statusModelFromJson,
    );
  }

  static editUser({
    required String id,
    required String userName,
    required String password,
    required String isAdmin,
    required String name,
  }) {
    return Crud.postRequest(
      url: Api.usersEdit,
      data: {
        'user_id': id,
        'user_name': userName,
        'user_password': password,
        'user_admin': isAdmin,
        'emp': name,
      },
      function: statusModelFromJson,
    );
  }

  static deleteUser({
    required String id,
  }) {
    return Crud.postRequest(
      url: Api.usersDelete,
      data: {
        'user_id': id,
      },
      function: statusModelFromJson,
    );
  }

  static login({
    required String userName,
  }) {
    return Crud.postRequest(
      url: Api.usersLogin,
      data: {
        'user_name': userName,
      },
      function: userModelFromJson,
    );
  }
}
