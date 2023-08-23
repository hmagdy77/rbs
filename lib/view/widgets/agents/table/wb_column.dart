import '../../../../libraries.dart';

class WbAgentColumn extends StatelessWidget {
  const WbAgentColumn({super.key, required this.agent});
  final Agent agent;
  @override
  Widget build(BuildContext context) {
    return agent.wbBlog == '0' &&
            agent.wbVideos == '0' &&
            agent.wbPhotos == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 200,
                text: AppStrings.website,
              ),
              agent.wbBlog == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.blog),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: agent.wbBlog),
                      ],
                    ),
              agent.wbVideos == '0'
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
                            text: agent.wbVideos),
                      ],
                    ),
              agent.wbPhotos == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.photos),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: agent.wbPhotos),
                      ],
                    ),
            ],
          );
  }
}
