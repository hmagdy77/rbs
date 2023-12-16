import '../../../../controllers/agents/agent_cart_controller.dart';
import '../../../../libraries.dart';

class WbReportColumn extends StatelessWidget {
  WbReportColumn({super.key, required this.agent, required this.bools});
  final Agent agent;
  final List<List<RxBool>> bools;
  final AgentCartControllerImp agentCartController =
      Get.find<AgentCartControllerImp>();
  @override
  build(BuildContext context) {
    return agent.wbVideos == '0' && agent.wbPhotos == '0' && agent.wbBlog == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: AppSizes.w15,
                text: AppStrings.website,
                color: AppColorManger.webColor,
              ),
              agent.wbVideos == '0'
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int index = 0; index < bools[9].length; index++)
                          Checkbox.adaptive(
                            value: bools[9][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[9][index].value = value;
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
                          color: AppColorManger.webColor,
                        ),
                      ],
                    ),
              agent.wbPhotos == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        for (int index = 0; index < bools[10].length; index++)
                          Checkbox.adaptive(
                            value: bools[10].isEmpty
                                ? false
                                : bools[10][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[10][index].value = value;
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
                          color: AppColorManger.webColor,
                        ),
                      ],
                    ),
              agent.wbBlog == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        for (int index = 0; index < bools[11].length; index++)
                          Checkbox.adaptive(
                            value: bools[11].isEmpty
                                ? false
                                : bools[11][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[11][index].value = value;
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
                          color: AppColorManger.webColor,
                        ),
                      ],
                    ),
            ],
          );
  }
}
