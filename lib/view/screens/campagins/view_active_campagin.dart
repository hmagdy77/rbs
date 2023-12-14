import '../../../libraries.dart';

class CampaginActiveViewScreen extends StatelessWidget {
  const CampaginActiveViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CampaginsControllerImp campaginsController =
        Get.find<CampaginsControllerImp>();
    final AgentsControllerImp agentsController =
        Get.find<AgentsControllerImp>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSizes.h01),
        child: Obx(
          () {
            campaginsController.sortActiveCampagins();
            if (campaginsController.isLoading.value ||
                agentsController.isLoading.value) {
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
                        launchInBrowser(
                          url: campagin.link,
                        );
                        // staticcampaginsController.clearTextFields();
                        // Navigator.pushNamed(context, AppRoutes.staticsAddScreen,
                        //     arguments: campagin);
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
                          campagin: campagin,
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
    );
  }
}
