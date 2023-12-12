import 'package:intl/intl.dart';

import '../../../controllers/agents/agent_cart_controller.dart';
import '../../../libraries.dart';
import 'table/fb_column.dart';
import 'table/ins_column.dart';

class AgentReport extends StatelessWidget {
  AgentReport({super.key, required this.agent, required this.bools});
  final Agent agent;
  final formatter = DateFormat('dd-MM-yyyy');
  final List<List<RxBool>> bools;
  final ReportsControllerImp reportsController =
      Get.find<ReportsControllerImp>();
  final AgentCartControllerImp agentCartController =
      Get.find<AgentCartControllerImp>();
  final UsersControllerImp usersController = Get.find<UsersControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.h01),
      color: AppColorManger.greyLight,
      child: Column(
        children: [
          MyImage(
            url: '${Api.agentsViewImage}/${agent.image}',
            height: AppSizes.h1,
            width: AppSizes.h1,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // WbReportColumn(
              //   agent: agent,
              //   bools: bools,
              // ),
              // YTReportColumn(
              //   agent: agent,
              //   bools: bools,
              // ),
              // DsReportColumn(
              //   agent: agent,
              //   bools: bools,
              // ),
              InsReportColumn(
                agent: agent,
                bools: bools,
              ),
              FBReportColumn(
                agent: agent,
                bools: bools,
              ),
            ],
          ),
          MyButton(
            text: AppStrings.add,
            onPressed: addReport,
          ),
        ],
      ),
    );
  }

  void addReport() {
    reportsController.addReportWithValues(
      agent: agent,
      byEmp: usersController.userName,
      fbPosts: bools[0].where((x) => x.value == true).length.toString(),
      fbRells: bools[1].where((x) => x.value == true).length.toString(),
      fbStorys: bools[2].where((x) => x.value == true).length.toString(),
      fbVideos: bools[3].where((x) => x.value == true).length.toString(),
      insPosts: bools[4].where((x) => x.value == true).length.toString(),
      insRells: bools[5].where((x) => x.value == true).length.toString(),
      insStorys: bools[6].where((x) => x.value == true).length.toString(),
      insHighlight: bools[7].where((x) => x.value == true).length.toString(),
      insVideos: bools[8].where((x) => x.value == true).length.toString(),
      wbVideos: bools[9].where((x) => x.value == true).length.toString(),
      wbphotos: bools[10].where((x) => x.value == true).length.toString(),
      wbBlog: bools[11].where((x) => x.value == true).length.toString(),
      ytVideos: bools[12].where((x) => x.value == true).length.toString(),
      ytShorts: bools[13].where((x) => x.value == true).length.toString(),
      dsCover: bools[14].where((x) => x.value == true).length.toString(),
      dsFrame: bools[15].where((x) => x.value == true).length.toString(),
      dsPosts: bools[16].where((x) => x.value == true).length.toString(),
    );
  }
}
