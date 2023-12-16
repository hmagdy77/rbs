import '../../../../libraries.dart';

class YTAgentColumn extends StatelessWidget {
  const YTAgentColumn({super.key, required this.agent});
  final Agent agent;
  @override
  Widget build(BuildContext context) {
    return agent.ytShorts == '0' && agent.ytVideos == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 200,
                text: AppStrings.youtube,
              ),
              agent.ytShorts == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.shorts),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: agent.ytShorts),
                      ],
                    ),
              agent.ytVideos == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.videos),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: agent.ytVideos),
                      ],
                    ),
            ],
          );
  }
}
