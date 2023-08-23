import '../../../libraries.dart';
 import '../widgets/agents/agent_profile.dart';

class AgentDetailsScreen extends StatelessWidget {
  const AgentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;
    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
      ),
      endDrawer: DrawerColumn(agent: agent),
      body: Padding(
          padding: EdgeInsets.all(AppSizes.h01),
          child: AgentProfile(agent: agent)
          // Row(
          //   children: [
          //     Expanded(flex: 4, child: AgentProfile(agent: agent)),
          //     Expanded(flex: 1, child: DrawerColumn(agent: agent))
          //   ],
          // ),
          ),
      floatingActionButton: BlocBuilder<AgentsCubit, AgentsState>(
        builder: (context, state) {
          var cubit = context.read<AgentsCubit>();
          return FloatingActionButton(
            onPressed: () {
              cubit.prepareTextFields(agent: agent);
              Navigator.pushNamed(
                context,
                AppRoutes.agentsEditScreen,
                arguments: agent,
              );
            },
            child: const Icon(Icons.edit),
          );
        },
      ),
    );
  }
}
