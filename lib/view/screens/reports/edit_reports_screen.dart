import '../../../libraries.dart';

class ReportsEditScreen extends StatelessWidget {
  ReportsEditScreen({super.key});
  final ReportsControllerImp reportsController =
      Get.find<ReportsControllerImp>();
  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context)!.settings.arguments as List;
    Agent agent = args[0];
    Report report = args[1];

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                reportsController.editReport(
                    id: report.id, agentId: agent.id, context: context);
              },
              icon: const Icon(Icons.done),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                reportsController.deleteReport(id: report.id, context: context);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(agent.name),
            const SizedBox(width: 8),
            const Text(AppStrings.reportsEdit),
          ],
        ),
      ),
      body: ListView(
        children: [
          Obx(
            () {
              if (reportsController.isLoading.value) {
                return const Center(
                  child: MyLottieLoading(),
                );
              } else {
                return Column(
                  children: [
                    ReportsFaceBook(agent: agent, cubit: reportsController),
                    ReportsInstagram(agent: agent, cubit: reportsController),
                    ReportsWebSite(agent: agent, cubit: reportsController),
                    ReportsYouTube(agent: agent, cubit: reportsController),
                    ReportsDesign(agent: agent, cubit: reportsController),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}
