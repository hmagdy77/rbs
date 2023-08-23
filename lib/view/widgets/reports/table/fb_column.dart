import '../../../../libraries.dart';

class FBColumn extends StatelessWidget {
  const FBColumn({super.key, required this.report});
  final Report report;
  @override
  Widget build(BuildContext context) {
    return report.fbPosts == '0' &&
            report.fbVideos == '0' &&
            report.fbStorys == '0' &&
            report.fbRells == '0'
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
              report.fbPosts == '0'
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
                            text: report.fbPosts),
                      ],
                    ),
              report.fbVideos == '0'
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
                            text: report.fbVideos),
                      ],
                    ),
              report.fbStorys == '0'
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
                            text: report.fbStorys),
                      ],
                    ),
              report.fbRells == '0'
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
                            text: report.fbRells),
                      ],
                    )
            ],
          );
  }
}
