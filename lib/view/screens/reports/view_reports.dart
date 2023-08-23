 import '../../../libraries.dart';

class ReportsViewScreen extends StatelessWidget {
  const ReportsViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;
    var reportCubit = context.read<ReportsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
        leading: IconButton(
          onPressed: () {
            reportCubit.rangedReports.clear();
            reportCubit.clearSum();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<ReportsCubit, ReportsState>(
        builder: (context, state) {
          reportCubit.sortReports(agentId: int.parse(agent.id));
          if (state is ReportsStateLoading) {
            return const Center(
              child: MyLottieLoading(),
            );
          } else if (state is ReportsStateSucsses) {
            return reportCubit.rangedReports.isEmpty
                ? Center(
                    child: ScrolableWithChild(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(' ${AppStrings.to} ${reportCubit.endDate}'),
                              Text(
                                  ' ${AppStrings.from} ${reportCubit.startDate} '),
                            ],
                          ),
                          MyTableReports(
                            isHeader: true,
                            onTap: () {},
                            report: Report(
                              id: 'id',
                              agentId: agent.id,
                              byEmp: AppStrings.sum,
                              fbPosts: reportCubit.fbPostsSum.toString(),
                              fbRells: reportCubit.fbRellsSum.toString(),
                              fbStorys: reportCubit.fbStorysSum.toString(),
                              fbVideos: reportCubit.fbVideosSum.toString(),
                              insPosts: reportCubit.insPostsSum.toString(),
                              insRells: reportCubit.insRellsSum.toString(),
                              insStorys: reportCubit.insStorysSum.toString(),
                              insVideos: reportCubit.insVideosSum.toString(),
                              insHighlight:
                                  reportCubit.insHighlightSum.toString(),
                              wbBlog: reportCubit.wbBlogSum.toString(),
                              wbPhotos: reportCubit.wbphotosSum.toString(),
                              wbVideos: reportCubit.wbVideosSum.toString(),
                              ytShorts: reportCubit.ytShortsSum.toString(),
                              ytVideos: reportCubit.ytVideosSum.toString(),
                              dsFrame: reportCubit.dsFrameSum.toString(),
                              dsCover: reportCubit.dsCoverSum.toString(),
                              dsPosts: reportCubit.dsPostsSum.toString(),
                              date: DateTime.now(),
                            ),
                          ),
                          for (var item in reportCubit.agentReports)
                            MyTableReports(
                              isHeader: false,
                              onTap: () {
                                reportCubit.prepareTextFields(report: item);
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
                              Text(' ${AppStrings.to} ${reportCubit.endDate} '),
                              Text(
                                  ' ${AppStrings.from} ${reportCubit.startDate} '),
                            ],
                          ),
                          MyTableReports(
                            isHeader: true,
                            onTap: () {},
                            report: Report(
                              id: 'id',
                              agentId: agent.id,
                              byEmp: AppStrings.sum,
                              fbPosts: reportCubit.fbPostsSum.toString(),
                              fbRells: reportCubit.fbRellsSum.toString(),
                              fbStorys: reportCubit.fbStorysSum.toString(),
                              fbVideos: reportCubit.fbVideosSum.toString(),
                              insPosts: reportCubit.insPostsSum.toString(),
                              insRells: reportCubit.insRellsSum.toString(),
                              insStorys: reportCubit.insStorysSum.toString(),
                              insVideos: reportCubit.insVideosSum.toString(),
                              insHighlight:
                                  reportCubit.insHighlightSum.toString(),
                              wbBlog: reportCubit.wbBlogSum.toString(),
                              wbPhotos: reportCubit.wbphotosSum.toString(),
                              wbVideos: reportCubit.wbVideosSum.toString(),
                              ytShorts: reportCubit.ytShortsSum.toString(),
                              ytVideos: reportCubit.ytVideosSum.toString(),
                              dsFrame: reportCubit.dsFrameSum.toString(),
                              dsCover: reportCubit.dsCoverSum.toString(),
                              dsPosts: reportCubit.dsPostsSum.toString(),
                              date: DateTime.now(),
                            ),
                          ),
                          for (var item in reportCubit.rangedReports)
                            MyTableReports(
                              isHeader: false,
                              onTap: () {
                                reportCubit.prepareTextFields(report: item);
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
          } else {
            reportCubit.getReports(agentId: int.parse(agent.id));
            return const MyLottieLoading();
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                if (reportCubit.startDate.isEmpty ||
                    reportCubit.endDate.isEmpty) {
                  showSnakString(
                    context: context,
                    label: AppStrings.pleaseChoseDates,
                  );
                } else {
                  reportCubit.getReportsfromRange(
                    agentId: int.parse(agent.id),
                  );
                }
              },
              child: const Icon(Icons.view_day),
            ),
          ),
          // end
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                reportCubit.showDialog(
                  context: context,
                  child: SfDateRangePicker(
                    onSelectionChanged: (args) {
                      reportCubit.changeDate(date: args.value, kind: '2');
                    },
                    selectionMode: DateRangePickerSelectionMode.single,
                  ),
                );
              },
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          // Start
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                reportCubit.showDialog(
                  context: context,
                  child: SfDateRangePicker(
                    onSelectionChanged: (args) {
                      reportCubit.changeDate(date: args.value, kind: '1');
                    },
                    selectionMode: DateRangePickerSelectionMode.single,
                  ),
                );
              },
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
