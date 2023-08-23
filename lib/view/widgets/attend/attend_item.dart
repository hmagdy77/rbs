import 'package:intl/intl.dart';

import '../../../libraries.dart';

class AttendItem extends StatelessWidget {
  const AttendItem(
      {super.key, this.attend, required this.kind, required this.isHeader});
  final Attend? attend;
  final int kind;
  final bool isHeader;
  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('MM-dd');

    if (kind == 1) {
      if (isHeader) {
        return const Row(
          children: [
            MyCielFixed(
              text: AppStrings.exitTime,
              isHeader: false,
              width: 250,
              isBack: false,
            ),
            MyCielFixed(
              text: AppStrings.attendTime,
              isHeader: false,
              width: 250,
              isBack: false,
            ),
            MyCielFixed(
              text: AppStrings.name,
              isHeader: false,
              width: 250,
              isBack: false,
            ),
          ],
        );
      } else {
        return Row(
          children: [
            attend!.isExit == '0'
                ? const MyCielFixed(
                    text: AppStrings.inWork,
                    isHeader: false,
                    width: 250,
                    isBack: false,
                  )
                : MyCielFixed(
                    text: DateFormat.jm().format(attend!.empExit),
                    isHeader: false,
                    width: 250,
                    isBack: false,
                  ),
            MyCielFixed(
              text: DateFormat.jm().format(attend!.empAttend),
              isHeader: false,
              width: 250,
              isBack: false,
            ),
            MyCielFixed(
              text: attend!.empName,
              isHeader: false,
              width: 250,
              isBack: false,
            ),
          ],
        );
      }
    } else {
      if (isHeader) {
        return const Row(
          children: [
            MyCielFixed(
              text: AppStrings.exitTime,
              isHeader: false,
              width: 250,
              isBack: false,
            ),
            MyCielFixed(
              text: AppStrings.attendTime,
              isHeader: false,
              width: 250,
              isBack: false,
            ),
            MyCielFixed(
              text: AppStrings.date,
              isHeader: false,
              width: 250,
              isBack: false,
            ),
          ],
        );
      } else {
        return Row(
          children: [
            attend!.isExit == '0'
                ? const MyCielFixed(
                    text: AppStrings.inWork,
                    isHeader: false,
                    width: 250,
                    isBack: false,
                  )
                : MyCielFixed(
                    text: DateFormat.jm().format(attend!.empExit),
                    isHeader: false,
                    width: 250,
                    isBack: false,
                  ),
            MyCielFixed(
              text: DateFormat.jm().format(attend!.empAttend),
              isHeader: false,
              width: 250,
              isBack: false,
            ),
            MyCielFixed(
              text:
                  '${formatter.format(attend!.day)} ${DateFormat.EEEE().format(attend!.day)}',
              isHeader: false,
              width: 250,
              isBack: false,
            ),
          ],
        );
      }
    }
  }
}
