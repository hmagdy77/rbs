import 'package:intl/intl.dart';

import '../../../../libraries.dart';

class InfoAgentColumn extends StatelessWidget {
  InfoAgentColumn({super.key, required this.agent});
  final Agent agent;
  final formatter = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MyCielFixed(
          isBack: false,
          isHeader: true,
          width: 250,
          text: AppStrings.info,
        ),
        Row(
          children: [
            MyCielFixed(
                isBack: false,
                isHeader: false,
                width: 150,
                text: formatter.format(agent.renewalDate)),
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
                isBack: false,
                isHeader: false,
                width: 150,
                text: agent.fbVideos),
            const MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 100,
                text: AppStrings.by),
          ],
        ),
      ],
    );
  }
}
