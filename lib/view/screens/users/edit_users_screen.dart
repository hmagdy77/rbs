import '../../../libraries.dart';

class UsersEditScreen extends StatelessWidget {
  UsersEditScreen({super.key});
  final UsersControllerImp uersController = Get.find<UsersControllerImp>();

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.emp} ${AppStrings.edit}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () {
            if (uersController.isLoading.value) {
              return const MyLottieLoading();
            } else {
              return ListView(
                children: [
                  MyTextField(
                    hidePassword: false,
                    controller: uersController.name,
                    label: AppStrings.name,
                    sufIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: AppSizes.h02,
                  ),
                  MyTextField(
                    hidePassword: false,
                    controller: uersController.email,
                    label: AppStrings.userName,
                    sufIcon: const Icon(Icons.email),
                  ),
                  SizedBox(
                    height: AppSizes.h02,
                  ),
                  MyTextField(
                    hidePassword: false,
                    controller: uersController.password,
                    label: AppStrings.password,
                    sufIcon: const Icon(Icons.password),
                  ),
                  SizedBox(
                    height: AppSizes.h04,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: AppColorManger.primary,
                        ),
                        color: AppColorManger.greyLight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(AppStrings.user),
                        Switch.adaptive(
                          value: uersController.isAdmin.value,
                          onChanged: (value) {
                            uersController.changePremisionValue(value: value);
                          },
                        ),
                        const Text(AppStrings.admin),
                        const Text(AppStrings.premisson),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.h04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyButton(
                        text: AppStrings.edit,
                        onPressed: () {
                          uersController.editUser(context: context, user: user);
                        },
                      ),
                      MyButton(
                        text: AppStrings.delete,
                        onPressed: () {
                          uersController.deleteUser(
                              context: context, user: user);
                        },
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
