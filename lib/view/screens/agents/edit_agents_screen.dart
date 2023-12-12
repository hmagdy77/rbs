import '../../../libraries.dart';

class AgentsEditScreen extends StatelessWidget {
  const AgentsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;
    final AgentsControllerImp agentsController =
        Get.find<AgentsControllerImp>();

    return Obx(
      () {
        if (agentsController.isLoading.value) {
          return const Center(
            child: MyLottieLoading(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('${agent.name} ${AppStrings.agentEditInfo}'),
              actions: [
                IconButton(
                  onPressed: () {
                    agentsController.editAgent(
                        context: context, id: agent.id, active: agent.active);
                  },
                  icon: const Icon(Icons.done),
                ),
                IconButton(
                  onPressed: () {
                    agentsController.deleteAgent(
                      context: context,
                      id: agent.id,
                      image: agent.image,
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: IconButton(
                //       onPressed: () {
                //         cubit.editAgent(
                //           context: context,
                //           id: agent.id,
                //           active: agent.active == '1'
                //               ? '0'
                //               : agent.active == '0'
                //                   ? '1'
                //                   : '1',
                //         );
                //       },
                //       child: agent.active == '1'
                //           ? const Icon(FontAwesomeIcons.act)
                //           : const Icon(Icons.disabled_by_default)),
                // ),
              ],
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    InfoWidget(),
                    FaceBookWidget(
                      fbPosts: agentsController.fbPosts,
                      fbRells: agentsController.fbRells,
                      fbStorys: agentsController.fbStorys,
                      fbVideos: agentsController.fbVideos,
                    ),
                    InstgramWidget(
                      insPosts: agentsController.insPosts,
                      insStorys: agentsController.insStorys,
                      insRells: agentsController.insRells,
                      insVideos: agentsController.insVideos,
                      insHighlight: agentsController.insHighlight,
                    ),
                    DesignWidget(
                      dsCover: agentsController.dsCover,
                      dsFrame: agentsController.dsFrame,
                      dsPosts: agentsController.dsPosts,
                    ),
                    YoutubeWidget(
                      ytVideos: agentsController.ytVideos,
                      ytShorts: agentsController.ytShorts,
                    ),
                    WebSiteWidget(
                      wbVideos: agentsController.wbVideos,
                      wbBlog: agentsController.wbBlog,
                      wbphotos: agentsController.wbphotos,
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
