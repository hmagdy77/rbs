import '../../../libraries.dart';

class ReportsFaceBook extends StatelessWidget {
  const ReportsFaceBook({
    super.key,
    required this.agent,
    required this.cubit,
  });

  final Agent agent;
  final ReportsControllerImp cubit;

  @override
  Widget build(BuildContext context) {
    return agent.fbPosts == '0' &&
            agent.fbVideos == '0' &&
            agent.fbStorys == '0' &&
            agent.fbRells == '0'
        ? const SizedBox()
        : MyExpandapleItem(
            label: AppStrings.facebook,
            child: Column(
              children: [
                agent.fbPosts == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.fbPosts,
                        sufIcon: const Icon(Icons.facebook),
                        label: AppStrings.fbPosts,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.fbRells == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.fbRells,
                        sufIcon: const Icon(Icons.facebook),
                        label: AppStrings.fbRells,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.fbStorys == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.fbStorys,
                        sufIcon: const Icon(Icons.facebook),
                        label: AppStrings.fbStorys,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.fbVideos == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.fbVideos,
                        sufIcon: const Icon(Icons.facebook),
                        label: AppStrings.fbVideos,
                      ),
              ],
            ),
          );
  }
}
