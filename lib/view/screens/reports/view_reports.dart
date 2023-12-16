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
                                fbPosts: reportsController.fbPostsSum.value
                                    .toString(),
                                fbRells: reportsController.fbRellsSum.value
                                    .toString(),
                                fbStorys: reportsController.fbStorysSum.value
                                    .toString(),
                                fbVideos: reportsController.fbVideosSum.value
                                    .toString(),
                                insPosts: reportsController.insPostsSum.value
                                    .toString(),
                                insRells: reportsController.insRellsSum.value
                                    .toString(),
                                insStorys: reportsController.insStorysSum.value
                                    .toString(),
                                insVideos: reportsController.insVideosSum.value
                                    .toString(),
                                insHighlight: reportsController
                                    .insHighlightSum.value
                                    .toString(),
                                wbBlog: reportsController.wbBlogSum.value
                                    .toString(),
                                wbPhotos: reportsController.wbphotosSum.value
                                    .toString(),
                                wbVideos: reportsController.wbVideosSum.value
                                    .toString(),
                                ytShorts: reportsController.ytShortsSum.value
                                    .toString(),
                                ytVideos: reportsController.ytVideosSum.value
                                    .toString(),
                                dsFrame: reportsController.dsFrameSum.value
                                    .toString(),
                                dsCover: reportsController.dsCoverSum.value
                                    .toString(),
                                dsPosts: reportsController.dsPostsSum.value
                                    .toString(),
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
                                fbPosts: reportsController.fbPostsSum.value
                                    .toString(),
                                fbRells: reportsController.fbRellsSum.value
                                    .toString(),
                                fbStorys: reportsController.fbStorysSum.value
                                    .toString(),
                                fbVideos: reportsController.fbVideosSum.value
                                    .toString(),
                                insPosts: reportsController.insPostsSum.value
                                    .toString(),
                                insRells: reportsController.insRellsSum.value
                                    .toString(),
                                insStorys: reportsController.insStorysSum.value
                                    .toString(),
                                insVideos: reportsController.insVideosSum.value
                                    .toString(),
                                insHighlight: reportsController
                                    .insHighlightSum.value
                                    .toString(),
                                wbBlog: reportsController.wbBlogSum.value
                                    .toString(),
                                wbPhotos: reportsController.wbphotosSum.value
                                    .toString(),
                                wbVideos: reportsController.wbVideosSum.value
                                    .toString(),
                                ytShorts: reportsController.ytShortsSum.value
                                    .toString(),
                                ytVideos: reportsController.ytVideosSum.value
                                    .toString(),
                                dsFrame: reportsController.dsFrameSum.value
                                    .toString(),
                                dsCover: reportsController.dsCoverSum.value
                                    .toString(),
                                dsPosts: reportsController.dsPostsSum.value
                                    .toString(),
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
          // print(reportsController.insPostsSum.value.toString());
          // print(reportsController.insStorysSum.value.toString());
          // print(reportsController.insVideosSum.value.toString());
          // print(reportsController.insRellsSum.value.toString());
          // print(reportsController.insHighlightSum.value.toString());

          printReports(
            fPost: reportsController.fbPostsSum.value.toString(),
            fRells: reportsController.fbRellsSum.value.toString(),
            fStory: reportsController.fbStorysSum.value.toString(),
            fVideo: reportsController.fbVideosSum.value.toString(),
            insPost: reportsController.insPostsSum.value.toString(),
            insRells: reportsController.insRellsSum.value.toString(),
            insStory: reportsController.insStorysSum.value.toString(),
            insVideo: reportsController.insVideosSum.value.toString(),
            insHeiglights: reportsController.insHighlightSum.value.toString(),
            wBlog: reportsController.wbBlogSum.value.toString(),
            wPhotos: reportsController.wbphotosSum.value.toString(),
            wVideo: reportsController.wbVideosSum.value.toString(),
            yShorts: reportsController.ytShortsSum.value.toString(),
            yVideo: reportsController.ytVideosSum.value.toString(),
            dFreame: reportsController.dsFrameSum.value.toString(),
            dCover: reportsController.dsCoverSum.value.toString(),
            dPost: reportsController.dsPostsSum.value.toString(),
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
