import 'package:intl/intl.dart';

import '../../libraries.dart';

class UsersController extends GetxController {}

class UsersControllerImp extends UsersController {
  List<User> allUsers = [];
  List<User> loginList = [];
  var formatter = DateFormat('yyyy-MM-dd');
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  var isAdmin = false.obs;
  int userType = 2;
  String userName = "";
  var isLoading = false.obs;
  MyService myService = Get.find();

  @override
  onInit() {
    int? type = myService.sharedPreferences.getInt(AppStrings.adminKey);
    String? name =
        myService.sharedPreferences.getString(AppStrings.keyUserName);

    if (type != null) {
      userType = type;
    }
    if (name != null) {
      userName = name;
    }

    viewUsers();
    super.onInit();
  }

  login({
    required context,
  }) async {
    isLoading(true);
    update();
    var login = await UsersRepo.login(userName: email.text);
    try {
      loginList.clear();
      if (login.status == "suc") {
        isLoading(false);
        update();
        loginList.addAll(login.data);
        var user = loginList[0];
        if (user.userPassword != password.text) {
          showSnakString(context: context, label: AppStrings.wrongPassword);
        } else {
          isLoading(false);
          update();
          userType = int.parse(user.userAdmin);
          userName = user.emp;
          myService.sharedPreferences.setInt(AppStrings.adminKey, userType);
          myService.sharedPreferences
              .setString(AppStrings.keyUserName, userName);
          await AttendRepo.attend(
            name: userName,
            day: formatter.format(DateTime.now()),
            time: DateTime.now().toString(),
          );
          showSnakString(context: context, label: AppStrings.done);
          Navigator.pushNamed(context, AppRoutes.homeScreen);
        }
      } else if (login.status == "fail") {
        isLoading(false);
        update();
        showSnakString(context: context, label: AppStrings.userNotFound);
      }
    } catch (_) {
      MySnackBar.snack(AppStrings.faild, 'message');
      isLoading(false);
      update();
    }
  }

  logOut() async {
    try {
      String name = myService.sharedPreferences
          .getString(AppStrings.keyUserName) as String;
      var logOut = await AttendRepo.exit(
        name: name,
        day: formatter.format(DateTime.now()),
        time: DateTime.now().toString(),
      );
      if (logOut.status == "suc") {
        MySnackBar.snack(AppStrings.done, 'message');
      } else {
        MySnackBar.snack(AppStrings.faild, 'message');
      }
      userName = '';
      userType = 0;
      email.clear();
      password.clear();
      myService.sharedPreferences.clear();
      loginList.clear();
      Get.offAllNamed(AppRoutes.loginScreen);
    } catch (_) {
      // MySnackBar.snack(AppStrings.faild, 'message');
      isLoading(false);
      update();
    }
  }

  viewUsers() async {
    isLoading(true);
    update();
    try {
      var users = await UsersRepo.viewUsers();
      if (users.status == 'suc') {
        allUsers.clear();
        allUsers.addAll(users.data);
        isLoading(false);
        update();
      } else {
        isLoading(false);
        update();
      }
    } catch (e) {
      isLoading(false);
      update();
    }
  }

  addUser({required context}) async {
    try {
      isLoading(true);
      update();
      var users = await UsersRepo.addUser(
        isAdmin: isAdmin.value ? '1' : '0',
        name: name.text,
        password: password.text,
        userName: email.text,
      );
      if (users.status == 'suc') {
        MySnackBar.snack(AppStrings.done, 'message');
        isLoading(false);
        update();
      } else {
        MySnackBar.snack(AppStrings.faild, 'message');
        isLoading(false);
        update();
      }
    } catch (_) {
      MySnackBar.snack(AppStrings.faild, 'message');
      isLoading(false);
      update();
    }
  }

  editUser({required User user, required context}) async {
    isLoading(true);
    update();
    try {
      var editStaticsRepo = await UsersRepo.editUser(
        id: user.userId,
        name: name.text,
        password: password.text,
        userName: email.text,
        isAdmin: isAdmin.value ? '1' : '0',
      );
      if (editStaticsRepo.status == 'suc') {
        MySnackBar.snack(AppStrings.done, 'message');
        isLoading(false);
        update();
      } else {
        MySnackBar.snack(AppStrings.faild, 'message');
        isLoading(false);
        update();
      }
    } catch (e) {
      MySnackBar.snack(AppStrings.faild, 'message');
      isLoading(false);
      update();
    }
  }

  deleteUser({required User user, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        try {
          isLoading(true);
          update();
          var users = await UsersRepo.deleteUser(
            id: user.userId,
          );
          if (users.status == 'suc') {
            MySnackBar.snack(AppStrings.done, 'message');
            isLoading(false);
            update();
          } else {
            MySnackBar.snack(AppStrings.faild, 'message');
            isLoading(false);
            update();
          }
        } catch (e) {
          MySnackBar.snack(AppStrings.faild, 'message');
          isLoading(false);
          update();
        }
      },
    );
  }

  prepareTextFields({required User user}) {
    email.text = user.userName;
    password.text = user.userPassword;
    name.text = user.emp;
    isAdmin.value = user.userAdmin == '1' ? true : false;
  }

  changePremisionValue({required bool value}) {
    isAdmin.value = value;
    update();
  }

  clearTextFields() {
    email.clear();
    password.clear();
    name.clear();
  }
}
