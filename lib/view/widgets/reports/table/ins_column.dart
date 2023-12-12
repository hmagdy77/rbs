import '../../../../libraries.dart';

class InsColumn extends StatelessWidget {
  const InsColumn({super.key, required this.report});
  final Report report;
  @override
  Widget build(BuildContext context) {
    return report.insPosts == '0' &&
            report.insVideos == '0' &&
            report.insStorys == '0' &&
            report.insRells == '0' &&
            report.insHighlight == '0'
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
              report.insPosts == '0'
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
                            text: report.insPosts),
                      ],
                    ),
              report.insVideos == '0'
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
                            text: report.insVideos),
                      ],
                    ),
              report.insStorys == '0'
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
                            text: report.insStorys),
                      ],
                    ),
              report.insRells == '0'
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
                            text: report.insRells),
                      ],
                    ),
              report.insHighlight == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.highlig),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: report.insHighlight),
                      ],
                    ),
            ],
          );
  }
}
