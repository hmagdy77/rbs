import '../../../libraries.dart';

class AlertsAddScreen extends StatelessWidget {
  AlertsAddScreen({super.key});
  final AlertsControllerImp alertsController = Get.find<AlertsControllerImp>();
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();
  final UsersControllerImp usersController = Get.find<UsersControllerImp>();

  @override
  Widget build(BuildContext context) {
    String kind = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          kind == '0'
              ? Text(
                  AppStrings.alerts,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : Text(
                  AppStrings.ideas,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
          Expanded(child: Obx(
            () {
              if (alertsController.isLoading.value ||
                  agentsController.isLoading.value ||
                  usersController.isLoading.value) {
                return const Center(
                  child: MyLottieLoading(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      MyTextField(
                        hidePassword: false,
                        controller: alertsController.title,
                        label: AppStrings.title,
                        sufIcon: const Icon(Icons.label),
                      ),
                      SizedBox(
                        height: AppSizes.h04,
                      ),
                      MyTextField(
                        hidePassword: false,
                        controller: alertsController.content,
                        label: AppStrings.content,
                        sufIcon: const Icon(Icons.content_copy),
                        maxLines: 6,
                      ),
                      SizedBox(
                        height: AppSizes.h04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyButton(
                            text: AppStrings.add,
                            onPressed: () {
                              if (usersController.userName.isEmpty) {
                                Navigator.pushNamed(
                                    context, AppRoutes.loginScreen);
                              } else if (alertsController.title.text.isEmpty ||
                                  alertsController.content.text.isEmpty ||
                                  agentsController.selectedAgent.isEmpty) {
                                showSnakString(
                                    context: context,
                                    label: AppStrings.pleaseEnterAllWanted);
                              } else {
                                alertsController.addAlert(
                                  agent: agentsController.selectedAgent,
                                  creater: usersController.userName,
                                  context: context,
                                  kind: kind,
                                );
                              }
                            },
                          ),
                          DropMenu(agentsController: agentsController),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}

class DropMenu extends StatelessWidget {
  const DropMenu({
    super.key,
    required this.agentsController,
  });

  final AgentsControllerImp agentsController;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      // width: AppSizes.w5 * 2,
      enableFilter: true,
      leadingIcon: const Icon(Icons.search),
      label: agentsController.selectedAgent.isEmpty
          ? Text(AppStrings.agentsChose,
              style: Theme.of(context).textTheme.displayMedium)
          : Text(agentsController.selectedAgent,
              style: Theme.of(context).textTheme.displayMedium),
      dropdownMenuEntries: agentsController.agentsMenu,
      textStyle: Theme.of(context).textTheme.displayMedium,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: (agent) {
        agentsController.selectedAgent = agent!.name;
      },
    );
  }
}
