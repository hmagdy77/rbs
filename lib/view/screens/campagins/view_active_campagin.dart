 import '../../../libraries.dart';

class CampaginActiveViewScreen extends StatelessWidget {
  const CampaginActiveViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var staticCubit = context.read<StaticssCubit>();
    String label = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.h01),
        child: BlocBuilder<CampaginsCubit, CampaginState>(
          builder: (context, state) {
            var cubit = context.read<CampaginsCubit>();
            var agentsCubit = context.read<AgentsCubit>();
            cubit.sortActiveCampagins();
            if (state is CampaginLoading) {
              return const Center(
                child: MyLottieLoading(),
              );
            } else if (state is CampaginSucsses) {
              if (cubit.agentCampagins.isEmpty) {
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
                    var campagin = cubit.agentCampagins[index];
                    return CampagineItem(
                      campagin: campagin,
                      ontap1: () {
                        cubit.prepareTextFields(campagin: campagin);
                        Navigator.pushNamed(
                            context, AppRoutes.campaginEditScreen,
                            arguments: campagin);
                      },
                      ontap2: () {
                        launchUrlStr(
                          url: campagin.link,
                        );
                        // staticCubit.clearTextFields();
                        // Navigator.pushNamed(context, AppRoutes.staticsAddScreen,
                        //     arguments: campagin);
                      },
                      ontap3: () {
                        agentsCubit.getAgentsByCampagin(
                          campaginAgentId: int.parse(campagin.agentId),
                        );
                        Navigator.pushNamed(
                            context, AppRoutes.staticsViewScreen,
                            arguments: campagin);
                      },
                      onChanged: (value) {
                        cubit.activeCampagin(
                            id: campagin.id,
                            active: campagin.active == '1'
                                ? '0'
                                : campagin.active == '0'
                                    ? '1'
                                    : '1',
                            context: context);
                      },
                    );
                  },
                  itemCount: cubit.agentCampagins.length,
                );
              }
            } else {
              cubit.getCampagins(id: '1');
              return const MyLottieLoading();
            }
          },
        ),
      ),
    );
  }
}
