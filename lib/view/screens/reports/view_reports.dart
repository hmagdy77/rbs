import '../../../core/print/pdf_reports.dart';
import '../../../libraries.dart';

class ReportsViewScreen extends StatelessWidget {
  ReportsViewScreen({super.key});

  final ReportsControllerImp reportsController =
      Get.find<ReportsControllerImp>();

  final UsersControllerImp usersController = Get.find<UsersControllerImp>();
  @override
  Widget build(BuildContext context) {
    Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;

    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
        leading: IconButton(
          onPressed: () {
            reportsController.rangedReports.clear();
            reportsController.clearSum();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          // Start
          IconButton(
            onPressed: () {
              reportsController.showDialog(
                context: context,
                child: SfDateRangePicker(
                  onSelectionChanged: (args) {
                    reportsController.changeDate(date: args.value, kind: '1');
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          // end
          IconButton(
            onPressed: () {
              reportsController.showDialog(
                context: context,
                child: SfDateRangePicker(
                  onSelectionChanged: (args) {
                    reportsController.changeDate(date: args.value, kind: '2');
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () {
              if (reportsController.startDate.isEmpty ||
                  reportsController.endDate.isEmpty) {
                showSnakString(
                  context: context,
                  label: AppStrings.pleaseChoseDates,
                );
              } else {
                reportsController.getReportsfromRange(
                  agentId: int.parse(agent.id),
                );
              }
            },
            icon: const Icon(Icons.get_app_rounded),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Obx(
          () {
            reportsController.sortReports(agentId: int.parse(agent.id));
            if (reportsController.isLoading.value) {
              return const Center(
                child: MyLottieLoading(),
              );
            } else {
              return reportsController.rangedReports.isEmpty
                  ? Center(
                      child: ScrolableWithChild(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                    ' ${AppStrings.from} ${reportsController.startDate}    '),
                                Text(
                                    ' ${AppStrings.to} ${reportsController.endDate}'),
                              ],
                            ),
                            MyTableReports(
                              isHeader: true,
                              onTap: () {},
                              report: Report(
                                id: 'id',
                                agentId: agent.id,
                                byEmp: AppStrings.sum,
                                fbPosts:
                                    reportsController.fbPostsSum.toString(),
                                fbRells:
                                    reportsController.fbRellsSum.toString(),
                                fbStorys:
                                    reportsController.fbStorysSum.toString(),
                                fbVideos:
                                    reportsController.fbVideosSum.toString(),
                                insPosts:
                                    reportsController.insPostsSum.toString(),
                                insRells:
                                    reportsController.insRellsSum.toString(),
                                insStorys:
                                    reportsController.insStorysSum.toString(),
                                insVideos:
                                    reportsController.insVideosSum.toString(),
                                insHighlight: reportsController.insHighlightSum
                                    .toString(),
                                wbBlog: reportsController.wbBlogSum.toString(),
                                wbPhotos:
                                    reportsController.wbphotosSum.toString(),
                                wbVideos:
                                    reportsController.wbVideosSum.toString(),
                                ytShorts:
                                    reportsController.ytShortsSum.toString(),
                                ytVideos:
                                    reportsController.ytVideosSum.toString(),
                                dsFrame:
                                    reportsController.dsFrameSum.toString(),
                                dsCover:
                                    reportsController.dsCoverSum.toString(),
                                dsPosts:
                                    reportsController.dsPostsSum.toString(),
                                date: DateTime.now(),
                              ),
                            ),
                            for (var item in reportsController.agentReports)
                              MyTableReports(
                                isHeader: false,
                                onTap: () {
                                  reportsController.prepareTextFields(
                                      report: item);
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.reportsEditScreen,
                                    arguments: [agent, item],
                                  );
                                },
                                report: item,
                              ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: ScrolableWithChild(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                    ' ${AppStrings.from} ${reportsController.startDate}    '),
                                Text(
                                    ' ${AppStrings.to} ${reportsController.endDate} '),
                              ],
                            ),
                            MyTableReports(
                              isHeader: true,
                              onTap: () {},
                              report: Report(
                                id: 'id',
                                agentId: agent.id,
                                byEmp: AppStrings.sum,
                                fbPosts:
                                    reportsController.fbPostsSum.toString(),
                                fbRells:
                                    reportsController.fbRellsSum.toString(),
                                fbStorys:
                                    reportsController.fbStorysSum.toString(),
                                fbVideos:
                                    reportsController.fbVideosSum.toString(),
                                insPosts:
                                    reportsController.insPostsSum.toString(),
                                insRells:
                                    reportsController.insRellsSum.toString(),
                                insStorys:
                                    reportsController.insStorysSum.toString(),
                                insVideos:
                                    reportsController.insVideosSum.toString(),
                                insHighlight: reportsController.insHighlightSum
                                    .toString(),
                                wbBlog: reportsController.wbBlogSum.toString(),
                                wbPhotos:
                                    reportsController.wbphotosSum.toString(),
                                wbVideos:
                                    reportsController.wbVideosSum.toString(),
                                ytShorts:
                                    reportsController.ytShortsSum.toString(),
                                ytVideos:
                                    reportsController.ytVideosSum.toString(),
                                dsFrame:
                                    reportsController.dsFrameSum.toString(),
                                dsCover:
                                    reportsController.dsCoverSum.toString(),
                                dsPosts:
                                    reportsController.dsPostsSum.toString(),
                                date: DateTime.now(),
                              ),
                            ),
                            for (var item in reportsController.rangedReports)
                              MyTableReports(
                                isHeader: false,
                                onTap: () {
                                  reportsController.prepareTextFields(
                                      report: item);
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.reportsEditScreen,
                                    arguments: [agent, item],
                                  );
                                },
                                report: item,
                              ),
                          ],
                        ),
                      ),
                    );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          printReports(
            fPost: reportsController.fbPostsSum.toString(),
            fRells: reportsController.fbRellsSum.toString(),
            fStory: reportsController.fbStorysSum.toString(),
            fVideo: reportsController.fbVideosSum.toString(),
            insPost: reportsController.insPostsSum.toString(),
            insRells: reportsController.insRellsSum.toString(),
            insStory: reportsController.insStorysSum.toString(),
            insVideo: reportsController.insVideosSum.toString(),
            insHeiglights: reportsController.insHighlightSum.toString(),
            wBlog: reportsController.wbBlogSum.toString(),
            wPhotos: reportsController.wbphotosSum.toString(),
            wVideo: reportsController.wbVideosSum.toString(),
            yShorts: reportsController.ytShortsSum.toString(),
            yVideo: reportsController.ytVideosSum.toString(),
            dFreame: reportsController.dsFrameSum.toString(),
            dCover: reportsController.dsCoverSum.toString(),
            dPost: reportsController.dsPostsSum.toString(),
            today: reportsController.formatter.format(DateTime.now()),
            start: reportsController.startDate.value,
            end: reportsController.endDate.value,
            emp: usersController.userName,
            agentName: agent.name,
          );
        },
        child: const Icon(Icons.print),
      ),
    );
  }
}
