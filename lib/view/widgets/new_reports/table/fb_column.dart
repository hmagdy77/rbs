import '../../../../controllers/agents/agent_cart_controller.dart';
import '../../../../libraries.dart';

class FBReportColumn extends StatelessWidget {
  FBReportColumn({super.key, required this.agent, required this.bools});
  final Agent agent;
  final List<List<RxBool>> bools;
  final AgentCartControllerImp agentCartController =
      Get.find<AgentCartControllerImp>();
  @override
  build(BuildContext context) {
    return agent.fbPosts == '0' &&
            agent.fbVideos == '0' &&
            agent.fbStorys == '0' &&
            agent.fbRells == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: AppSizes.w3,
                text: AppStrings.facebook,
                color: AppColorManger.faceBookColor,
              ),
              agent.fbPosts == '0'
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int index = 0; index < bools[0].length; index++)
                          Checkbox.adaptive(
                            value: bools[0][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[0][index].value = value;
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
                          color: AppColorManger.faceBookColor,
                        ),
                      ],
                    ),
              agent.fbRells == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        for (int index = 0; index < bools[1].length; index++)
                          Checkbox.adaptive(
                            value: bools[1].isEmpty
                                ? false
                                : bools[1][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[1][index].value = value;
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
                          color: AppColorManger.faceBookColor,
                        ),
                      ],
                    ),
              agent.fbStorys == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        for (int index = 0; index < bools[2].length; index++)
                          Checkbox.adaptive(
                            value: bools[2].isEmpty
                                ? false
                                : bools[2][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[2][index].value = value;
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
                          color: AppColorManger.faceBookColor,
                        ),
                      ],
                    ),
              agent.fbVideos == '0'
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int index = 0; index < bools[3].length; index++)
                          Checkbox.adaptive(
                            value: bools[3].isEmpty
                                ? false
                                : bools[3][index].value,
                            onChanged: (value) {
                              if (value != null) {
                                bools[3][index].value = value;
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
                          color: AppColorManger.faceBookColor,
                        ),
                      ],
                    ),
            ],
          );
  }
}
