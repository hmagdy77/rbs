import '../../libraries.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var usersCubit = context.read<UsersCubit>();
    usersCubit.userName = 'Test';
    usersCubit.userType = 1;
    var attendCubit = context.read<AttendCubit>();
    var agentsCubit = context.read<AgentsCubit>();

    return Scaffold(
      appBar: usersCubit.userName.isEmpty
          ? null
          : AppBar(
              title: Text(usersCubit.userName),
              leading: const SizedBox(),
              actions: appBarActions(
                context: context,
                attendCubit: attendCubit,
                usersCubit: usersCubit,
              ),
            ),
      body: usersCubit.userName.isEmpty
          ? LoginWidget(usersCubit: usersCubit)
          : ListView(
              shrinkWrap: true,
              children: const [
                SizedBox(
                  height: 10,
                ),
                AlertsArea(),
                HomeBody(
                  goTo: AppRoutes.agentDetailsScreen,
                ),
              ],
            ),
      floatingActionButton: usersCubit.userName.isEmpty
          ? const SizedBox()
          : FloatingActionButton(
              isExtended: true,
              onPressed: () async {
                agentsCubit.clearTextFields();
                Navigator.pushNamed(context, AppRoutes.agentsAddScreen);
              },
              child: const Icon(
                Icons.add,
              ),
            ),
    );
  }
}

List<Widget> appBarActions(
    {required context,
    required AttendCubit attendCubit,
    required UsersCubit usersCubit}) {
  return [
    usersCubit.userType != 1
        ? const SizedBox()
        : IconButton(
            onPressed: () {
              attendCubit.viewAttend(date: DateTime.now());
              Navigator.pushNamed(
                context,
                AppRoutes.homeSafeScreen,
                arguments: AppStrings.safe,
              );
            },
            icon: const Icon(FontAwesomeIcons.dollarSign),
          ),
    usersCubit.userType != 1
        ? const SizedBox()
        : IconButton(
            onPressed: () {
              attendCubit.viewAttend(date: DateTime.now());
              Navigator.pushNamed(
                context,
                AppRoutes.campaginActiveViewScreen,
                arguments: AppStrings.camaginsActive,
              );
            },
            icon: const Icon(Icons.campaign_sharp),
          ),
    usersCubit.userType != 1
        ? const SizedBox()
        : IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.usersViewScreen,
                arguments: AppStrings.users,
              );
            },
            icon: const Icon(FontAwesomeIcons.peopleGroup),
          ),
    usersCubit.userType != 1
        ? const SizedBox()
        : IconButton(
            onPressed: () {
              attendCubit.viewAttend(date: DateTime.now());
              Navigator.pushNamed(
                context,
                AppRoutes.attendViewScreen,
                arguments: AppStrings.attendAndExit,
              );
            },
            icon: const Icon(FontAwesomeIcons.calendar),
          ),
    IconButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoutes.alertsViewScreen,
          arguments: '2',
        );
      },
      icon: const Icon(FontAwesomeIcons.lightbulb),
    ),
    IconButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoutes.alertsViewScreen,
          arguments: '0',
        );
      },
      icon: const Icon(Icons.notifications),
    ),
    IconButton(
      onPressed: () {
        usersCubit.logOut(context: context);
      },
      icon: const Icon(Icons.exit_to_app),
    ),
  ];
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required this.usersCubit,
  });

  final UsersCubit usersCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersLoading) {
          return const MyLottieLoading();
        } else {
          return Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: AppColorManger.primary,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: AppSizes.h03,
                            ),
                            MyTextField(
                              controller: usersCubit.email,
                              sufIcon: const Icon(Icons.person),
                              label: AppStrings.userName,
                              hidePassword: false,
                              onFieldSubmitted: (value) {
                                usersCubit.login(context: context);
                              },
                            ),
                            SizedBox(
                              height: AppSizes.h03,
                            ),
                            MyTextField(
                              controller: usersCubit.password,
                              sufIcon: const Icon(Icons.password_rounded),
                              label: AppStrings.password,
                              hidePassword: true,
                              onFieldSubmitted: (value) {
                                usersCubit.login(context: context);
                              },
                            ),
                            SizedBox(
                              height: AppSizes.h03,
                            ),
                            MyButton(
                              minWidth: AppSizes.w3,
                              text: AppStrings.login,
                              onPressed: () async {
                                usersCubit.login(context: context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          );
        }
      },
    );
  }
}
