import '../../../../libraries.dart';

class DsAgentColumn extends StatelessWidget {
  const DsAgentColumn({super.key, required this.agent});
  final Agent agent;
  @override
  Widget build(BuildContext context) {
    return agent.dsPosts == '0' && agent.dsCover == '0' && agent.dsFrame == '0'
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
              agent.dsPosts == '0'
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
                            text: agent.dsPosts),
                      ],
                    ),
              agent.dsCover == '0'
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
                            text: agent.dsCover),
                      ],
                    ),
              agent.dsFrame == '0'
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
                            text: agent.dsFrame),
                      ],
                    ),
            ],
          );
  }
}
