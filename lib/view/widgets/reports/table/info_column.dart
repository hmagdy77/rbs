import 'package:intl/intl.dart';

import '../../../../libraries.dart';

class InfoColumn extends StatelessWidget {
  InfoColumn({super.key, required this.report});
  final Report report;
  final formatter = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MyCielFixed(
          isBack: false,
          isHeader: true,
          width: 300,
          text: AppStrings.info,
        ),
        Row(
          children: [
            MyCielFixed(
                isBack: false,
                isHeader: false,
                width: 200,
                text: formatter.format(report.date)),
            const MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 100,
                text: AppStrings.date),
          ],
        ),
        Row(
          children: [
            MyCielFixed(
                isBack: false, isHeader: false, width: 200, text: report.byEmp),
            const MyCielFixed(
                isBack: false, isHeader: true, width: 100, text: AppStrings.by),
          ],
        ),
      ],
    );
  }
}
