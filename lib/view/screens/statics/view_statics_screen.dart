import 'package:intl/intl.dart';

import '../../../core/print/pdf_campagins.dart';
import '../../../libraries.dart';

class StaticsViewScreen extends StatelessWidget {
  StaticsViewScreen({super.key});
  final StaticsControllerImp staticsController =
      Get.find<StaticsControllerImp>();
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();
  final UsersControllerImp usersController = Get.find<UsersControllerImp>();

  @override
  Widget build(BuildContext context) {
    Campagin campagin = ModalRoute.of(context)!.settings.arguments as Campagin;

    return Scaffold(
      appBar: AppBar(
        title: Text(agentsController.campaginAgent[0].name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            MyButton(
              text: campagin.name,
              onPressed: () {
                launchInBrowser(
                  url: campagin.link,
                );
              },
            ),
            Obx(
              () {
                staticsController.sortStaticss(
                    camaginId: int.parse(campagin.id));
                if (staticsController.isLoading.value) {
                  return const Center(
                    child: MyLottieLoading(),
                  );
                } else {
                  if (staticsController.campaginStaticss.isEmpty) {
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
                              comments: staticsController.commentsSum,
                              likes: staticsController.likesSum,
                              message: staticsController.messagesSum,
                              reach: staticsController.reachSum,
                              startDate: staticsController.formatter
                                  .format(campagin.startDate),
                              endDate: staticsController.formatter
                                  .format(campagin.endDate),
                            ),
                            MyTableStatics(
                              isHeader: true,
                              isSum: false,
                            ),
                            // ScrolableWithChild
                            Column(
                              children: [
                                for (var item
                                    in staticsController.campaginStaticss)
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
                                      staticsController.deleteStatics(
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
                }
              },
            ),
            MyButton(
              text: AppStrings.add,
              onPressed: () {
                staticsController.clearTextFields();
                Navigator.pushNamed(
                  context,
                  AppRoutes.staticsAddScreen,
                  arguments: campagin,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          printFunc(campagin: campagin);
        },
        child: const Icon(Icons.print),
      ),
    );
  }

  printFunc({required Campagin campagin}) async {
    staticsController.printItems.clear();
    List statics = staticsController.campaginStaticss;
    for (int i = 0; i < statics.length; i++) {
      staticsController.printItems.add(
        [
          DateFormat.yMMMMEEEEd().format(statics[i].date),
          statics[i].reach,
          statics[i].likes,
          statics[i].comments,
          statics[i].messages
        ],
      );
    }
    printCampagins(
      items: staticsController.printItems,
      camName: campagin.name,
      today: staticsController.formatter.format(DateTime.now()),
      start: staticsController.formatter.format(campagin.startDate),
      end: staticsController.formatter.format(campagin.endDate),
      emp: usersController.userName,
      comments: staticsController.commentsSum.toString(),
      likes: staticsController.likesSum.toString(),
      messages: staticsController.messagesSum.toString(),
      reach: staticsController.reachSum.toString(),
    );
  }
}
