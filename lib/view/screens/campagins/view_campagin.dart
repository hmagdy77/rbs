import '../../../libraries.dart';

class CampaginViewScreen extends StatelessWidget {
  CampaginViewScreen({super.key});

  final CampaginsControllerImp campaginsController =
      Get.find<CampaginsControllerImp>();
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();

  @override
  Widget build(BuildContext context) {
    Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;

    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.h01),
        child: Obx(
          () {
            campaginsController.sortCampagins(id: int.parse(agent.id));
            if (campaginsController.isLoading.value) {
              return const Center(
                child: MyLottieLoading(),
              );
            } else {
              if (campaginsController.agentCampagins.isEmpty) {
                return const MyLottieEmpty();
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: AppSizes.h35,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var campagin = campaginsController.agentCampagins[index];
                    return CampagineItem(
                      campagin: campagin,
                      ontap1: () {
                        campaginsController.prepareTextFields(
                            campagin: campagin);
                        Navigator.pushNamed(
                            context, AppRoutes.campaginEditScreen,
                            arguments: campagin);
                      },
                      ontap2: () {
                        // staticcampaginsController.clearTextFields();
                        // Navigator.pushNamed(context, AppRoutes.staticsAddScreen,
                        //     arguments: campagin);
                        launchInBrowser(
                          url: campagin.link,
                        );
                      },
                      ontap3: () {
                        agentsController.getAgentsByCampagin(
                          campaginAgentId: int.parse(campagin.agentId),
                        );
                        Navigator.pushNamed(
                            context, AppRoutes.staticsViewScreen,
                            arguments: campagin);
                      },
                      onChanged: (value) {
                        campaginsController.activeCampagin(
                          id: campagin.id,
                          active: campagin.active == '1'
                              ? '0'
                              : campagin.active == '0'
                                  ? '1'
                                  : '1',
                        );
                      },
                    );
                  },
                  itemCount: campaginsController.agentCampagins.length,
                );
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          campaginsController.clearTextFields();
          Navigator.pushNamed(
            context,
            AppRoutes.campaginAddScreen,
            arguments: agent,
          );
        },
        child: const Icon(Icons.add),
      ),
      //AddCampagineButton(agent: agent),
    );
  }
}
