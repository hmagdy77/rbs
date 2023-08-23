 import '../../../libraries.dart';

class ReportsInstagram extends StatelessWidget {
  const ReportsInstagram({
    super.key,
    required this.agent,
    required this.cubit,
  });

  final Agent agent;
  final ReportsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return agent.insPosts == '0' &&
            agent.insHighlight == '0' &&
            agent.insRells == '0' &&
            agent.insStorys == '0' &&
            agent.insVideos == '0'
        ? const SizedBox()
        : MyExpandapleItem(
            label: AppStrings.instgram,
            child: Column(
              children: [
                agent.insPosts == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.insPosts,
                        sufIcon: const Icon(FontAwesomeIcons.instagram),
                        label: AppStrings.insPosts,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.insHighlight == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.insHighlight,
                        sufIcon: const Icon(FontAwesomeIcons.instagram),
                        label: AppStrings.insHighlight,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.insRells == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.insRells,
                        sufIcon: const Icon(FontAwesomeIcons.instagram),
                        label: AppStrings.insRells,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.insStorys == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.insStorys,
                        sufIcon: const Icon(FontAwesomeIcons.instagram),
                        label: AppStrings.insStorys,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.insVideos == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.insVideos,
                        sufIcon: const Icon(FontAwesomeIcons.instagram),
                        label: AppStrings.insVideos,
                      ),
              ],
            ),
          );
  }
}
