import '../../../../controllers/agents/agent_cart_controller.dart';
import '../../../../libraries.dart';

class YTReportColumn extends StatelessWidget {
  YTReportColumn({super.key, required this.agent, required this.bools});
  final Agent agent;
  final List<List<RxBool>> bools;
  final AgentCartControllerImp agentCartController =
      Get.find<AgentCartControllerImp>();
  @override
  build(BuildContext context) {
    return agent.ytVideos == '0' && agent.ytShorts == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: AppSizes.w15,
                text: AppStrings.youtube,
                color: AppColorManger.ytColor,
              ),
              agent.ytVideos == '0'
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int index = 0; index < bools[12].length; index++)
                          Checkbox.adaptive(
                            value: bools[12][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[12][index].value = value;
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
                          color: AppColorManger.ytColor,
                        ),
                      ],
                    ),
              agent.ytShorts == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        for (int index = 0; index < bools[13].length; index++)
                          Checkbox.adaptive(
                            value: bools[13].isEmpty
                                ? false
                                : bools[13][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[13][index].value = value;
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
                          text: AppStrings.shorts,
                          color: AppColorManger.ytColor,
                        ),
                      ],
                    ),
            ],
          );
  }
}
