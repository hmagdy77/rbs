import '../../../libraries.dart';

class ReportsAddScreen extends StatelessWidget {
  ReportsAddScreen({super.key});

  final ReportsControllerImp reportsController =
      Get.find<ReportsControllerImp>();
  final UsersControllerImp usersController = Get.find<UsersControllerImp>();

  @override
  Widget build(BuildContext context) {
    var agent = ModalRoute.of(context)!.settings.arguments as Agent;

    return Scaffold(
      appBar: AppBar(title: Text(agent.name)),
      body: ListView(
        children: [
          Obx(
            () {
              if (reportsController.isLoading.value) {
                return const Center(
                  child: MyLottieLoading(),
                );
              } else {
                return Column(
                  children: [
                    //  MyExpandapleItem
                    ReportsFaceBook(agent: agent, cubit: reportsController),
                    ReportsInstagram(agent: agent, cubit: reportsController),
                    ReportsWebSite(agent: agent, cubit: reportsController),
                    ReportsYouTube(agent: agent, cubit: reportsController),
                    ReportsDesign(agent: agent, cubit: reportsController),
                    MyButton(
                      minWidth: AppSizes.w3,
                      text: AppStrings.add,
                      onPressed: () {
                        if (usersController.userName.isEmpty) {
                          Navigator.pushNamed(context, AppRoutes.loginScreen);
                        } else {
                          reportsController.addReport(
                            byEmp: usersController.userName,
                            agentId: agent.id,
                          );
                        }
                      },
                    ),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}
