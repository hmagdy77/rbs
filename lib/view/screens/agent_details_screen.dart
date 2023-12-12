import '../../../libraries.dart';
import '../widgets/agents/agent_profile.dart';

class AgentDetailsScreen extends StatelessWidget {
  AgentDetailsScreen({super.key});
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();
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
          child: AgentProfile(agent: agent)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          agentsController.prepareTextFields(agent: agent);
          Navigator.pushNamed(
            context,
            AppRoutes.agentsEditScreen,
            arguments: agent,
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
