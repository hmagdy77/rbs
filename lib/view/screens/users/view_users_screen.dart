import '../../../libraries.dart';

class UsersViewScreen extends StatelessWidget {
  UsersViewScreen({super.key});
  final UsersControllerImp uersController = Get.find<UsersControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () {
                  if (uersController.isLoading.value) {
                    return const MyLottieLoading();
                  } else {
                    List<User> users = uersController.allUsers;
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
                                  uersController.prepareTextFields(user: item);
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
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          uersController.clearTextFields();
          Navigator.pushNamed(context, AppRoutes.usersAddScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
