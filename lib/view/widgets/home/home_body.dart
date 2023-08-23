 import '../../../libraries.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.goTo,
  });
  final String goTo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<AgentsCubit, AgentsState>(
        builder: (context, state) {
          var cubit = context.read<AgentsCubit>();
          if (state is AgentsInit) {
            cubit.getAgents(context: context);
            return const Center(
              child: MyLottieLoading(),
            );
          } else if (state is AgentsLoading) {
            return const Center(
              child: MyLottieLoading(),
            );
          } else if (state is AgentsSucsses) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: AppSizes.h35,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                var agent = cubit.allAgents[index];
                return AgentItem(
                  onChanged: (value) {
                    try {
                      cubit.activeAgent(
                        id: agent.id,
                        active: agent.active == '1'
                            ? '0'
                            : agent.active == '0'
                                ? '1'
                                : '1',
                        context: context,
                      );
                    } catch (_) {}
                  },
                  value: agent.active == '1' ? true : false,
                  agent: agent,
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      goTo,
                      arguments: cubit.allAgents[index],
                    );
                  },
                );
              },
              itemCount: cubit.allAgents.length,
            );
          } else if (state is AgentsError) {
            return const MyLottieInternet();
          } else {
            cubit.getAgents(context: context);
            return const Center(
              child: MyLottieInternet(),
            );
          }
        },
      ),
    );
  }
}
