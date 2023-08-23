 import '../../../libraries.dart';

class AgentsAddScreen extends StatelessWidget {
  const AgentsAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var agent = ModalRoute.of(context)!.settings.arguments;
    var cubit = context.read<AgentsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.agentsAdd),
      ),
      body: ListView(
        children: [
          BlocBuilder<AgentsCubit, AgentsState>(
            builder: (context, state) {
              if (state is AgentsLoading) {
                return const Center(
                  child: MyLottieLoading(),
                );
              } else {
                return Column(
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

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     MyButton(
                    //       // minWidth: AppSizes.w3,
                    //       text: AppStrings.agentsAdd,
                    //       onPressed: () {},
                    //     ),
                    //     MyButton(
                    //       text: AppStrings.choeseImage,
                    //       onPressed: () {

                    //       },
                    //       // minWidth: AppSizes.w3,
                    //     ),
                    //   ],
                    // ),
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
                if (cubit.imageName == null) {
                  showSnakString(
                      context: context, label: AppStrings.choeseImage);
                } else {
                  cubit.addAgent(context: context);
                }
              },
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                cubit.startWebFilePicker();
              },
              child: const Icon(Icons.photo),
            ),
          ),
        ],
      ),
    );
  }
}
