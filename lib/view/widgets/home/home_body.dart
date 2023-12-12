import '../../../libraries.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key, required this.goTo});
  final String goTo;
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Obx(
        () {
          if (agentsController.isLoading.value) {
            return const Center(
              child: MyLottieLoading(),
            );
          } else {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: AppSizes.h35,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                var agent = agentsController.allAgents[index];
                return AgentItem(
                  onChanged: (value) {
                    try {
                      agentsController.activeAgent(
                        id: agent.id,
                        active: agent.active == '1'
                            ? '0'
                            : agent.active == '0'
                                ? '1'
                                : '1',
                      );
                    } catch (_) {}
                  },
                  value: agent.active == '1' ? true : false,
                  agent: agent,
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      goTo,
                      arguments: agentsController.allAgents[index],
                    );
                  },
                );
              },
              itemCount: agentsController.allAgents.length,
            );
          }
        },
      ),
    );
  }
}
