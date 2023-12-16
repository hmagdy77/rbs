import '../../../../controllers/agents/agent_cart_controller.dart';
import '../../../../libraries.dart';

class DsReportColumn extends StatelessWidget {
  DsReportColumn({super.key, required this.agent, required this.bools});
  final Agent agent;
  final List<List<RxBool>> bools;
  final AgentCartControllerImp agentCartController =
      Get.find<AgentCartControllerImp>();
  @override
  build(BuildContext context) {
    return agent.dsCover == '0' && agent.dsFrame == '0' && agent.dsPosts == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: AppSizes.w15,
                text: AppStrings.design,
                color: AppColorManger.designColor,
              ),
              agent.dsCover == '0'
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int index = 0; index < bools[14].length; index++)
                          Checkbox.adaptive(
                            value: bools[14][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[14][index].value = value;
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
                          text: AppStrings.cover,
                          color: AppColorManger.designColor,
                        ),
                      ],
                    ),
              agent.dsFrame == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        for (int index = 0; index < bools[15].length; index++)
                          Checkbox.adaptive(
                            value: bools[15].isEmpty
                                ? false
                                : bools[15][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[15][index].value = value;
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
                          text: AppStrings.frame,
                          color: AppColorManger.designColor,
                        ),
                      ],
                    ),
              agent.dsPosts == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        for (int index = 0; index < bools[16].length; index++)
                          Checkbox.adaptive(
                            value: bools[16].isEmpty
                                ? false
                                : bools[16][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[16][index].value = value;
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
                          color: AppColorManger.designColor,
                        ),
                      ],
                    ),
            ],
          );
  }
}
