 
import '../../../libraries.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UsersCubit>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h3,
          horizontal: AppSizes.h5,
        ),
        child: Column(
          children: [
            SizedBox(
              height: AppSizes.h03,
            ),
            MyTextField(
              controller: cubit.email,
              sufIcon: const Icon(Icons.person),
              label: AppStrings.userName,
              hidePassword: false,
            ),
            SizedBox(
              height: AppSizes.h03,
            ),
            MyTextField(
              controller: cubit.password,
              sufIcon: const Icon(Icons.password_rounded),
              label: AppStrings.password,
              hidePassword: true,
            ),
            SizedBox(
              height: AppSizes.h03,
            ),
            SizedBox(
              height: AppSizes.h03,
            ),
            MyButton(
              minWidth: AppSizes.w3,
              text: AppStrings.login,
              onPressed: () async {
                cubit.login(context: context);
              },
            ),
          ],
        ),
      ),
      
    );
  }
}
