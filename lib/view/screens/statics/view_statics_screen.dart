 import '../../../libraries.dart';

class StaticsViewScreen extends StatelessWidget {
  const StaticsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Campagin campagin = ModalRoute.of(context)!.settings.arguments as Campagin;
    var agentsCubit = context.read<AgentsCubit>();
    var cubit = context.read<StaticssCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(agentsCubit.campaginAgent[0].name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            MyButton(
              text: campagin.name,
              onPressed: () {
                launchUrlStr(
                  url: campagin.link,
                );
              },
            ),
            BlocBuilder<StaticssCubit, StaticsState>(
              builder: (context, state) {
                cubit.sortStaticss(camaginId: int.parse(campagin.id));
                if (state is StaticsLoading) {
                  return const Center(
                    child: MyLottieLoading(),
                  );
                } else if (state is StateSucsses) {
                  if (cubit.campaginStaticss.isEmpty) {
                    return const MyLottieEmpty();
                  } else {
                    return Center(
                      child: ScrolableWithChild(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyTableStatics(
                              isHeader: false,
                              isSum: true,
                              comments: cubit.commentsSum,
                              likes: cubit.likesSum,
                              message: cubit.messagesSum,
                              reach: cubit.reachSum,
                              startDate:
                                  cubit.formatter.format(campagin.startDate),
                              endDate: cubit.formatter.format(campagin.endDate),
                            ),
                            MyTableStatics(
                              isHeader: true,
                              isSum: false,
                            ),
                            // ScrolableWithChild
                            Column(
                              children: [
                                for (var item in cubit.campaginStaticss)
                                  MyTableStatics(
                                    isSum: false,
                                    isHeader: false,
                                    statics: item,
                                    onTap: () {
                                      // cubit.prepareTextFields(statics: item);
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   AppRoutes.staticsEditScreen,
                                      //   arguments: item,
                                      // );
                                      cubit.deleteStatics(
                                        id: item.id,
                                        context: context,
                                      );
                                    },
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                } else {
                  cubit.getStaticss(camaginId: campagin.id);
                  return const MyLottieLoading();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.clearTextFields();
          Navigator.pushNamed(
            context,
            AppRoutes.staticsAddScreen,
            arguments: campagin,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
