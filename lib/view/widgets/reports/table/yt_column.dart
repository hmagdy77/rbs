import '../../../../libraries.dart';

class YTColumn extends StatelessWidget {
  const YTColumn({super.key, required this.report});
  final Report report;
  @override
  Widget build(BuildContext context) {
    return report.ytShorts == '0' && report.ytVideos == '0'
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
              report.ytShorts == '0'
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
                            text: report.ytShorts),
                      ],
                    ),
              report.ytVideos == '0'
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
                            text: report.ytVideos),
                      ],
                    ),
            ],
          );
  }
}
