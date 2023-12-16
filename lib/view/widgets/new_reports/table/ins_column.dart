import '../../../../controllers/agents/agent_cart_controller.dart';
import '../../../../libraries.dart';

class InsReportColumn extends StatelessWidget {
  InsReportColumn({super.key, required this.agent, required this.bools});
  final Agent agent;
  final List<List<RxBool>> bools;
  final AgentCartControllerImp agentCartController =
      Get.find<AgentCartControllerImp>();
  @override
  build(BuildContext context) {
    return agent.insPosts == '0' &&
            agent.insVideos == '0' &&
            agent.insStorys == '0' &&
            agent.insRells == '0' &&
            agent.insHighlight == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: AppSizes.w3,
                text: AppStrings.instgram,
                color: AppColorManger.instgramColor,
              ),
              agent.insPosts == '0'
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int index = 0; index < bools[4].length; index++)
                          Checkbox.adaptive(
                            value: bools[4][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[4][index].value = value;
                                if (value) {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x + 1).toString();
                                  agentCartController.allDoneReports.value++;
                                } else {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x - 1).toString();
                                  agentCartController.allDoneReports.value--;
                                }
                                agentCartController.upd();
                              }
                            },
                          ),
                        const MyCielFixed(
                          isBack: false,
                          isHeader: true,
                          width: 100,
                          text: AppStrings.posts,
                          color: AppColorManger.instgramColor,
                        ),
                      ],
                    ),
              agent.insRells == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        for (int index = 0; index < bools[5].length; index++)
                          Checkbox.adaptive(
                            value: bools[5].isEmpty
                                ? false
                                : bools[5][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[5][index].value = value;
                                if (value) {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x + 1).toString();
                                  agentCartController.allDoneReports.value++;
                                } else {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x - 1).toString();
                                  agentCartController.allDoneReports.value--;
                                }
                                agentCartController.upd();
                              }
                            },
                          ),
                        const MyCielFixed(
                          isBack: false,
                          isHeader: true,
                          width: 100,
                          text: AppStrings.rells,
                          color: AppColorManger.instgramColor,
                        ),
                      ],
                    ),
              agent.insStorys == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        for (int index = 0; index < bools[6].length; index++)
                          Checkbox.adaptive(
                            value: bools[6].isEmpty
                                ? false
                                : bools[6][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[6][index].value = value;
                                if (value) {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x + 1).toString();
                                  agentCartController.allDoneReports.value++;
                                } else {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x - 1).toString();
                                  agentCartController.allDoneReports.value--;
                                }
                                agentCartController.upd();
                              }
                            },
                          ),
                        const MyCielFixed(
                          isBack: false,
                          isHeader: true,
                          width: 100,
                          text: AppStrings.storys,
                          color: AppColorManger.instgramColor,
                        ),
                      ],
                    ),
              agent.insHighlight == '0'
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int index = 0; index < bools[7].length; index++)
                          Checkbox.adaptive(
                            value: bools[7].isEmpty
                                ? false
                                : bools[7][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[7][index].value = value;
                                if (value) {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x + 1).toString();
                                  agentCartController.allDoneReports.value++;
                                } else {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x - 1).toString();
                                  agentCartController.allDoneReports.value--;
                                }
                                agentCartController.upd();
                              }
                            },
                          ),
                        const MyCielFixed(
                          isBack: false,
                          isHeader: true,
                          width: 100,
                          text: AppStrings.highlight,
                          color: AppColorManger.instgramColor,
                        ),
                      ],
                    ),
              agent.insVideos == '0'
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int index = 0; index < bools[8].length; index++)
                          Checkbox.adaptive(
                            value: bools[8].isEmpty
                                ? false
                                : bools[8][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[8][index].value = value;
                                if (value) {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x + 1).toString();
                                  agentCartController.allDoneReports.value++;
                                } else {
                                  int x = int.parse(agent.reportsDone);
                                  agent.reportsDone = (x - 1).toString();
                                  agentCartController.allDoneReports.value--;
                                }
                                agentCartController.upd();
                              }
                            },
                          ),
                        const MyCielFixed(
                          isBack: false,
                          isHeader: true,
                          width: 100,
                          text: AppStrings.videos,
                          color: AppColorManger.instgramColor,
                        ),
                      ],
                    ),
            ],
          );
  }
}
