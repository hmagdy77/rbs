import '../../../libraries.dart';

class UsersEditScreen extends StatelessWidget {
  const UsersEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    var cubit = context.read<UsersCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.emp} ${AppStrings.edit}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const MyLottieLoading();
            } else {
              return ListView(
                children: [
                  MyTextField(
                    hidePassword: false,
                    controller: cubit.name,
                    label: AppStrings.name,
                    sufIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: AppSizes.h02,
                  ),
                  MyTextField(
                    hidePassword: false,
                    controller: cubit.email,
                    label: AppStrings.userName,
                    sufIcon: const Icon(Icons.email),
                  ),
                  SizedBox(
                    height: AppSizes.h02,
                  ),
                  MyTextField(
                    hidePassword: false,
                    controller: cubit.password,
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
                          value: cubit.isAdmin,
                          onChanged: (value) {
                            cubit.changePremisionValue(value: value);
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
                          cubit.editUser(context: context, user: user);
                        },
                      ),
                      MyButton(
                        text: AppStrings.delete,
                        onPressed: () {
                          cubit.deleteUser(context: context, user: user);
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
