 import '../../../libraries.dart';

class AgentsEditScreen extends StatelessWidget {
  const AgentsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;
    return BlocBuilder<AgentsCubit, AgentsState>(
      builder: (context, state) {
        var cubit = context.read<AgentsCubit>();
        if (state is AgentsLoading) {
          return const Center(
            child: MyLottieLoading(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('${agent.name} ${AppStrings.agentEditInfo}'),
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    const InfoWidget(),
                    FaceBookWidget(
                      fbPosts: cubit.fbPosts,
                      fbRells: cubit.fbRells,
                      fbStorys: cubit.fbStorys,
                      fbVideos: cubit.fbVideos,
                    ),
                    InstgramWidget(
                      insPosts: cubit.insPosts,
                      insStorys: cubit.insStorys,
                      insRells: cubit.insRells,
                      insVideos: cubit.insVideos,
                      insHighlight: cubit.insHighlight,
                    ),
                    DesignWidget(
                      dsCover: cubit.dsCover,
                      dsFrame: cubit.dsFrame,
                      dsPosts: cubit.dsPosts,
                    ),
                    YoutubeWidget(
                      ytVideos: cubit.ytVideos,
                      ytShorts: cubit.ytShorts,
                    ),
                    WebSiteWidget(
                      wbVideos: cubit.wbVideos,
                      wbBlog: cubit.wbBlog,
                      wbphotos: cubit.wbphotos,
                    ),
                  ],
                ),
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      cubit.editAgent(
                          context: context, id: agent.id, active: agent.active);
                    },
                    child: const Icon(Icons.done),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      cubit.deleteAgent(
                        context: context,
                        id: agent.id,
                        image: agent.image,
                      );
                    },
                    child: const Icon(Icons.delete),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: FloatingActionButton(
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
          );
        }
      },
    );
  }
}
