import 'package:intl/intl.dart';

import '../../../libraries.dart';
import 'table/ds_column.dart';
import 'table/fb_column.dart';
import 'table/info_column.dart';
import 'table/ins_column.dart';
import 'table/wb_column.dart';
import 'table/yt_column.dart';

class MyTableReports extends StatelessWidget {
  MyTableReports({
    super.key,
    this.report,
    this.onTap,
    required this.isHeader,
  });
  final Report? report;
  final bool isHeader;

  final VoidCallback? onTap;
  final formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColorManger.primary,
            border: Border.all(
              width: 2,
              color: AppColorManger.backdark,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FBColumn(report: report!),
              InsColumn(report: report!),
              WbColumn(report: report!),
              DsColumn(report: report!),
              YTColumn(report: report!),
              InfoColumn(report: report!),
            ],
          ),
        ),
        isHeader
            ? const SizedBox()
            : Positioned(
                top: 1,
                left: 1,
                child: GestureDetector(
                  onTap: onTap,
                  child: const CircleAvatar(
                    backgroundColor: AppColorManger.primary,
                    child: Icon(
                      Icons.edit,
                      color: AppColorManger.white,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
  // Expanded(
  //         flex: 1,
  //         child: MyButton(
  //           text: AppStrings.edit,
  //           onPressed: onTap,
  //         ),
  //       ),
      

// myService.sharedPreferences.getInt(MyStrings.adminKey) == 1
          //     ? MyCielReport(
          //         isBack: false,
          //         isHeader: false,
          //         width: 200,
          //         text: Reports!.ReportsPriceIn.toString(),
          //       )
          //     : Container(),
         