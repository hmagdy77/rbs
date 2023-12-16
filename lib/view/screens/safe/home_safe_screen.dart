import '../../../libraries.dart';

class HomeSafeScreen extends StatelessWidget {
  HomeSafeScreen({super.key});
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();
  final OpreationsControllerImp opreationsController =
      Get.find<OpreationsControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Obx(
          () {
            if (agentsController.isLoading.value) {
              return const Center(
                child: MyLottieLoading(),
              );
            } else {
              return ListView(
                children: [
                  SizedBox(
                    height: AppSizes.h02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${AppStrings.debtBalance} : ${agentsController.agentAccSum}',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${AppStrings.safePayment} : ${agentsController.safeList[0].value}',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSizes.h02,
                  ),
                  const AgentSafeItem(
                    isHeader: true,
                  ),
                  for (var agent in agentsController.allAgents)
                    AgentSafeItem(
                      isHeader: false,
                      agent: agent,
                      onTap: () {
                        opreationsController.rangedOpreations.clear();
                        Get.toNamed(
                          AppRoutes.agentSafeDetailsScreen,
                          arguments: [agent],
                        );
                      },
                    )
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          opreationsController.getOpreations();
          opreationsController.sortOpreations(id: '0');
          Get.toNamed(AppRoutes.viewPaymentScreen);
        },
        child: const Icon(Icons.payment),
      ),
    );
  }
}
