import '../../../../libraries.dart';

class DsColumn extends StatelessWidget {
  const DsColumn({super.key, required this.report});
  final Report report;
  @override
  Widget build(BuildContext context) {
    return report.dsPosts == '0' &&
            report.dsCover == '0' &&
            report.dsFrame == '0'
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 200,
                text: AppStrings.design,
              ),
              report.dsPosts == '0'
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
                            text: report.dsPosts),
                      ],
                    ),
              report.dsCover == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.cover),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: report.dsCover),
                      ],
                    ),
              report.dsFrame == '0'
                  ? const SizedBox()
                  : Row(
                      children: [
                        const MyCielFixed(
                            isBack: false,
                            isHeader: true,
                            width: 100,
                            text: AppStrings.frame),
                        MyCielFixed(
                            isBack: false,
                            isHeader: false,
                            width: 100,
                            text: report.dsFrame),
                      ],
                    ),
            ],
          );
  }
}
