import '../../../libraries.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final UsersControllerImp usersController = Get.find<UsersControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h02,
          horizontal: AppSizes.w02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSizes.h03,
            ),
            MyTextField(
              controller: usersController.email,
              sufIcon: const Icon(Icons.person),
              label: AppStrings.userName,
              hidePassword: false,
            ),
            SizedBox(
              height: AppSizes.h03,
            ),
            MyTextField(
              controller: usersController.password,
              sufIcon: const Icon(Icons.password_rounded),
              label: AppStrings.password,
              hidePassword: true,
            ),
            SizedBox(
              height: AppSizes.h03,
            ),
            MyButton(
              minWidth: AppSizes.w3,
              text: AppStrings.login,
              onPressed: () async {
                usersController.login(context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
