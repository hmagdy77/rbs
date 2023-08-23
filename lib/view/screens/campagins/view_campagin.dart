 import '../../../libraries.dart';
 
class CampaginViewScreen extends StatelessWidget {
  const CampaginViewScreen({super.key});
  // final Agent agent;
  // CampaginActiveViewScreen
  @override
  Widget build(BuildContext context) {
    Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;
    var cubit = context.read<CampaginsCubit>();
    // var staticCubit = context.read<StaticssCubit>();
    var agentsCubit = context.read<AgentsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.h01),
        child: BlocBuilder<CampaginsCubit, CampaginState>(
          builder: (context, state) {
            cubit.sortCampagins(id: int.parse(agent.id));
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
                        // staticCubit.clearTextFields();
                        // Navigator.pushNamed(context, AppRoutes.staticsAddScreen,
                        //     arguments: campagin);
                        launchUrlStr(
                          url: campagin.link,
                        );
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
              cubit.getCampagins(id: agent.id);
              return const MyLottieLoading();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.clearTextFields();
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
