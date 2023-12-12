import '../../../libraries.dart';

class ReportsYouTube extends StatelessWidget {
  const ReportsYouTube({
    super.key,
    required this.agent,
    required this.cubit,
  });

  final Agent agent;
  final ReportsControllerImp cubit;

  @override
  Widget build(BuildContext context) {
    return agent.ytShorts == '0' && agent.ytVideos == '0'
        ? const SizedBox()
        : MyExpandapleItem(
            label: AppStrings.youtube,
            child: Column(
              children: [
                agent.ytVideos == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.ytVideos,
                        sufIcon: const Icon(FontAwesomeIcons.youtube),
                        label: AppStrings.ytVideos,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.ytShorts == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.ytShorts,
                        sufIcon: const Icon(FontAwesomeIcons.youtube),
                        label: AppStrings.ytShorts,
                      ),
              ],
            ),
          );
  }
}
