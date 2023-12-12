import 'package:percent_indicator/percent_indicator.dart';

import '../../../controllers/agents/agent_cart_controller.dart';
import '../../../libraries.dart';
import '../../widgets/new_reports/agent_report.dart';

class ReportsArea extends StatelessWidget {
  ReportsArea({super.key});

  final ReportsControllerImp reportsController =
      Get.find<ReportsControllerImp>();
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();
  final AgentCartControllerImp agentCartController =
      Get.find<AgentCartControllerImp>();
  final UsersControllerImp usersController = Get.find<UsersControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.homeScreen);
            },
            icon: const Icon(Icons.home_filled)),
      ),
      body: Obx(() {
        if (reportsController.isLoading.value ||
            agentsController.isLoading.value ||
            agentCartController.isLoading.value) {
          return const MyLottieLoading();
        } else {
          return ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: AppSizes.h02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}',
                  ),
                  Column(
                    children: [
                      CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 5.0,
                        percent: agentCartController.allDoneReports.value /
                            agentCartController.allReports.value,
                        center: Text(
                            '% ${((agentCartController.allDoneReports.value / agentCartController.allReports.value) * 100).toStringAsFixed(1)}'),
                        progressColor: AppColorManger.primary,
                      ),
                      Text(
                        '${agentCartController.allReports.value} / ${agentCartController.allDoneReports.value}',
                      ),
                    ],
                  ),
                  MyButton(
                    text: AppStrings.addAll,
                    onPressed: addAllReports,
                  )
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: agentsController.activeAgents.length,
                itemBuilder: (context, index) {
                  Agent agent =
                      agentCartController.myAgents.keys.toList()[index];
                  List<List<RxBool>> bools =
                      agentCartController.myAgents.values.toList()[index];
                  return MyExpandapleItem(
                    color: AppColorManger.greyLight,
                    label: agent.name,
                    header: Row(
                      children: [
                        Text(
                          agent.name,
                          style: context.textTheme.displayMedium!,
                        ),
                        const Spacer(),
                        Text(
                            '${double.parse(agent.reports)} / ${double.parse(agent.reportsDone)}'),
                        LinearPercentIndicator(
                          width: AppSizes.w1,
                          lineHeight: AppSizes.h03,
                          percent: double.parse(agent.reportsDone) /
                              double.parse(agent.reports),
                          center: Text(
                            '% ${((double.parse(agent.reportsDone) / double.parse(agent.reports)) * 100).toStringAsFixed(1)}',
                            style: context.textTheme.displaySmall,
                          ),
                          progressColor: Colors.green,
                        ),
                      ],
                    ),
                    child: AgentReport(agent: agent, bools: bools),
                  );
                },
              ),
            ],
          );
        }
      }),
    );
  }

  void addAllReports() {
    List<Agent> agents = agentCartController.myAgents.keys.toList();
    List<List<List<RxBool>>> list =
        agentCartController.myAgents.values.toList();
    for (int index = 0; index < list.length; index++) {
      reportsController.addReportWithValues(
        agent: agents[index],
        byEmp: usersController.userName,
        fbPosts: list[index][0].where((x) => x.value == true).length.toString(),
        fbRells: list[index][1].where((x) => x.value == true).length.toString(),
        fbStorys:
            list[index][2].where((x) => x.value == true).length.toString(),
        fbVideos:
            list[index][3].where((x) => x.value == true).length.toString(),
        insPosts:
            list[index][4].where((x) => x.value == true).length.toString(),
        insRells:
            list[index][5].where((x) => x.value == true).length.toString(),
        insStorys:
            list[index][6].where((x) => x.value == true).length.toString(),
        insHighlight:
            list[index][7].where((x) => x.value == true).length.toString(),
        insVideos:
            list[index][8].where((x) => x.value == true).length.toString(),
        wbVideos:
            list[index][9].where((x) => x.value == true).length.toString(),
        wbphotos:
            list[index][10].where((x) => x.value == true).length.toString(),
        wbBlog: list[index][11].where((x) => x.value == true).length.toString(),
        ytVideos:
            list[index][12].where((x) => x.value == true).length.toString(),
        ytShorts:
            list[index][13].where((x) => x.value == true).length.toString(),
        dsCover:
            list[index][14].where((x) => x.value == true).length.toString(),
        dsFrame:
            list[index][15].where((x) => x.value == true).length.toString(),
        dsPosts:
            list[index][16].where((x) => x.value == true).length.toString(),
      );
    }
  }
}
