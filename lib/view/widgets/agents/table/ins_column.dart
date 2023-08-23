import '../../../../libraries.dart';

class InsAgentColumn extends StatelessWidget {
  const InsAgentColumn({super.key, required this.agent});
  final Agent agent;
  @override
  Widget build(BuildContext context) {
    return agent.insPosts == '0' &&
            agent.insVideos == '0' &&
            agent.insStorys == '0' &&
            agent.insRells == '0' &&
            agent.insHighlight == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 200,
                text: AppStrings.instgram,
              ),
              agent.insPosts == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.posts),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: agent.insPosts),
                      ],
                    ),
              agent.insVideos == '0'
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
                            text: agent.insVideos),
                      ],
                    ),
              agent.insStorys == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.storys),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: agent.insStorys),
                      ],
                    ),
              agent.insRells == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.rells),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: agent.insRells),
                      ],
                    ),
              agent.insHighlight == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.highlight),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: agent.insHighlight),
                      ],
                    ),
            ],
          );
  }
}
