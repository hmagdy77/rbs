 import '../../../libraries.dart';

class AgentSafeDetailsScreen extends StatelessWidget {
  const AgentSafeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;
    var cubit = context.read<OpreationsCubit>();
    var agentsCubit = context.read<AgentsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ScrolableWithChild(
          child: Column(
            children: [
              BlocBuilder<OpreationsCubit, OpreationsState>(
                builder: (context, state) {
                  cubit.sortOpreations(id: agent.id);
                  if (state is OpreationsChanged ||
                      cubit.allOpreations.isEmpty) {
                    cubit.getOpreations(id: agent.id);
                    return const MyLottieLoading();
                  } else if (state is OpreationsLoading) {
                    return const MyLottieLoading();
                  } else if (state is OpreationsFail) {
                    return const MyLottieEmpty();
                  } else {
                    return Column(
                      children: [
                        Text('${AppStrings.agentAcc} : ${agent.account}'),
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        MyTableOpreation(isHeader: true),
                        for (var item in cubit.agentOpreations)
                          MyTableOpreation(
                            isHeader: false,
                            opreation: item,
                            onTap: () {
                              cubit.deleteOpreation(
                                  id: item.id, context: context);
                              agentsCubit.updateAgentAcc(
                                id: item.agent,
                                account: item.kind == '1'
                                    ? item.price
                                    : '-${item.price}',
                                context: context,
                              );
                              if (item.kind == '1') {
                                agentsCubit.updateSafe(value: '-${item.price}');
                              }
                            },
                          ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              cubit.clearTextFields();
              Navigator.pushNamed(
                context,
                AppRoutes.addOpreationScreen,
                arguments: [agent, '1'],
              );
            },
            child: const Icon(FontAwesomeIcons.dollarSign),
          ),
          SizedBox(
            width: AppSizes.w01,
          ),
          FloatingActionButton(
            onPressed: () {
              cubit.clearTextFields();
              Navigator.pushNamed(
                context,
                AppRoutes.addOpreationScreen,
                arguments: [agent, '0'],
              );
            },
            child: const Icon(Icons.home_repair_service_sharp),
          ),
        ],
      ),
    );
  }
}
