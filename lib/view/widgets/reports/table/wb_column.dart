import '../../../../libraries.dart';

class WbColumn extends StatelessWidget {
  const WbColumn({super.key, required this.report});
  final Report report;
  @override
  Widget build(BuildContext context) {
    return report.wbBlog == '0' &&
            report.wbVideos == '0' &&
            report.wbPhotos == '0'
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
              report.wbBlog == '0'
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
                            text: report.wbBlog),
                      ],
                    ),
              report.wbVideos == '0'
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
                            text: report.wbVideos),
                      ],
                    ),
              report.wbPhotos == '0'
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
                            text: report.wbPhotos),
                      ],
                    ),
            ],
          );
  }
}
