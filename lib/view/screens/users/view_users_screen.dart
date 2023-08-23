 import '../../../libraries.dart';

class UsersViewScreen extends StatelessWidget {
  const UsersViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String label = ModalRoute.of(context)!.settings.arguments as String;

    var cubit = context.read<UsersCubit>();
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<UsersCubit, UsersState>(
                builder: (context, state) {
                  if (state is UsersInit) {
                    cubit.viewUsers();
                    return const MyLottieLoading();
                  } else if (state is UsersLoading) {
                    return const MyLottieLoading();
                  } else if (state is UsersError) {
                    return const MyLottieInternet();
                  } else if (state is UsersSucsses) {
                    List<User> users = cubit.allUsers;
                    return Align(
                      alignment: Alignment.topCenter,
                      child: ScrolableWithChild(
                        child: Column(
                          children: [
                            const UserItem(kind: 1),
                            for (var item in users)
                              UserItem(
                                kind: 2,
                                user: item,
                                ontap: () {
                                  cubit.prepareTextFields(user: item);
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.usersEditScreen,
                                    arguments: item,
                                  );
                                },
                              )
                          ],
                        ),
                      ),
                    );

                    // ListView.builder(
                    //   itemBuilder: (context, index) {
                    //     return UserItem(
                    //       kind: 2,
                    //       user: users[index],
                    //       ontap: () {
                    //         cubit.prepareTextFields(user: users[index]);
                    //         Navigator.pushNamed(
                    //           context,
                    //           AppRoutes.usersEditScreen,
                    //           arguments: users[index],
                    //         );
                    //       },
                    //     );
                    //   },
                    //   itemCount: users.length,
                    // );
                  } else if (state is UsersFail) {
                    cubit.viewUsers();
                    return const MyLottieEmpty();
                  } else {
                    cubit.viewUsers();
                    return const MyLottieLoading();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.clearTextFields();
          Navigator.pushNamed(context, AppRoutes.usersAddScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
