import '../../../../libraries.dart';

class FBAgentColumn extends StatelessWidget {
  const FBAgentColumn({super.key, required this.agent});
  final Agent agent;
  @override
  Widget build(BuildContext context) {
    return agent.fbPosts == '0' &&
            agent.fbVideos == '0' &&
            agent.fbStorys == '0' &&
            agent.fbRells == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 200,
                text: AppStrings.facebook,
              ),
              agent.fbPosts == '0'
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
                            text: agent.fbPosts),
                      ],
                    ),
              agent.fbVideos == '0'
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
                            text: agent.fbVideos),
                      ],
                    ),
              agent.fbStorys == '0'
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
                            text: agent.fbStorys),
                      ],
                    ),
              agent.fbRells == '0'
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
                            text: agent.fbRells),
                      ],
                    )
            ],
          );
  }
}
