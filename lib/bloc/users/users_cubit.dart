import 'package:intl/intl.dart';
import '../../libraries.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInit());
  List<User> allUsers = [];
  List<User> loginList = [];
  var formatter = DateFormat('yyyy-MM-dd');
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  bool isAdmin = false;
  int userType = 0;
  String userName = '';

  login({
    required context,
  }) async {
    emit(UsersLoading());
    var login = await UsersRepo.login(userName: email.text);
    try {
      loginList.clear();
      if (login.status == "suc") {
        emit(UsersChanged());
        loginList.addAll(login.data);
        var user = loginList[0];
        if (user.userPassword != password.text) {
          showSnakString(context: context, label: AppStrings.wrongPassword);
        } else {
          emit(UsersChanged());
          userType = int.parse(user.userAdmin);
          userName = user.emp;
          await AttendRepo.attend(
            name: userName,
            day: formatter.format(DateTime.now()),
            time: DateTime.now().toString(),
          );
          showSnakString(context: context, label: AppStrings.doneSuc);
          Navigator.pushNamed(context, AppRoutes.mainRoot);
        }
      } else if (login.status == "fail") {
        emit(UsersFail());
        showSnakString(context: context, label: AppStrings.userNotFound);
      }
    } catch (_) {
      showSnak(context: context, type: 0);
      emit(UsersError());
    }
  }

  logOut({required context}) async {
    emit(UsersLoading());
    try {
      var logOut = await AttendRepo.exit(
        name: loginList[0].emp,
        day: formatter.format(DateTime.now()),
        time: DateTime.now().toString(),
      );
      if (logOut.status == "suc") {
        userName = '';
        userType = 0;
        email.clear();
        password.clear();
        showSnak(context: context, type: 1);
        loginList.clear();
        emit(UsersChanged());
        Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
      } else {
        emit(UsersFail());
        showSnak(context: context, type: 0);
      }
    } catch (_) {
      showSnak(context: context, type: 0);
      emit(UsersError());
    }
  }

  viewUsers() async {
    emit(UsersLoading());
    try {
      var users = await UsersRepo.viewUsers();
      if (users.status == 'suc') {
        allUsers.clear();
        allUsers.addAll(users.data);
        emit(UsersSucsses());
      } else {
        emit(UsersFail());
      }
    } catch (e) {
      emit(UsersError());
    }
  }

  addUser({required context}) async {
    try {
      emit(UsersLoading());
      var users = await UsersRepo.addUser(
        isAdmin: isAdmin ? '1' : '0',
        name: name.text,
        password: password.text,
        userName: email.text,
      );
      if (users.status == 'suc') {
        showSnak(context: context, type: 1);
        emit(UsersChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(UsersFail());
      }
    } catch (_) {
      showSnak(context: context, type: 0);
      emit(UsersError());
    }
  }

  editUser({required User user, required context}) async {
    emit(UsersLoading());
    try {
      var editStaticsRepo = await UsersRepo.editUser(
        id: user.userId,
        name: name.text,
        password: password.text,
        userName: email.text,
        isAdmin: isAdmin ? '1' : '0',
      );
      if (editStaticsRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        emit(UsersChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(UsersFail());
      }
    } catch (e) {
      showSnak(context: context, type: 0);
      emit(UsersError());
    }
  }

  deleteUser({required User user, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        try {
          emit(UsersLoading());
          var users = await UsersRepo.deleteUser(
            id: user.userId,
          );
          if (users.status == 'suc') {
            showSnak(context: context, type: 1);
            emit(UsersSucsses());
          } else {
            showSnak(context: context, type: 0);
            emit(UsersFail());
          }
        } catch (e) {
          showSnak(context: context, type: 0);
          emit(UsersError());
        }
      },
    );
  }

  prepareTextFields({required User user}) {
    email.text = user.userName;
    password.text = user.userPassword;
    name.text = user.emp;
    isAdmin = user.userAdmin == '1' ? true : false;
  }

  changePremisionValue({required bool value}) {
    isAdmin = value;
    emit(UsersChanged());
  }

  clearTextFields() {
    email.clear();
    password.clear();
    name.clear();
  }
}
