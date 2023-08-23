 import '../../../libraries.dart';

class ReportsEditScreen extends StatelessWidget {
  const ReportsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context)!.settings.arguments as List;
    Agent agent = args[0];
    Report report = args[1];
    // Agent agent = ModalRoute.of(context)!.settings!.arguments![0]! as Agent;
    // Report report = ModalRoute.of(context)!.settings!.arguments![1]! as Report;
    var cubit = context.read<ReportsCubit>();
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(agent.name),
          const SizedBox(width: 8),
          const Text(AppStrings.reportsEdit),
        ],
      )),
      body: ListView(
        children: [
          BlocBuilder<ReportsCubit, ReportsState>(
            builder: (context, state) {
              if (state is ReportsStateLoading) {
                return const Center(
                  child: MyLottieLoading(),
                );
              } else {
                return Column(
                  children: [
                    ReportsFaceBook(agent: agent, cubit: cubit),
                    ReportsInstagram(agent: agent, cubit: cubit),
                    ReportsWebSite(agent: agent, cubit: cubit),
                    ReportsYouTube(agent: agent, cubit: cubit),
                    ReportsDesign(agent: agent, cubit: cubit),
                  ],
                );
              }
            },
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                cubit.editReport(
                    id: report.id, agentId: agent.id, context: context);
              },
              child: const Icon(Icons.done),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                cubit.deleteReport(id: report.id, context: context);
              },
              child: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
