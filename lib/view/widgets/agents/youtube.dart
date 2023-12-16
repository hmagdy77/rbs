import '../../../libraries.dart';

class YoutubeWidget extends StatelessWidget {
  const YoutubeWidget({
    super.key,
    required this.ytVideos,
    required this.ytShorts,
  });
  final TextEditingController ytVideos;
  final TextEditingController ytShorts;

  @override
  Widget build(BuildContext context) {
    return MyExpandapleItem(
      label: AppStrings.youtube,
      child: Column(
        children: [
          MyNumberField(
            controller: ytVideos,
            sufIcon: const Icon(FontAwesomeIcons.youtube),
            label: AppStrings.ytVideos,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: ytShorts,
            sufIcon: const Icon(FontAwesomeIcons.youtube),
            label: AppStrings.ytShorts,
          ),
        ],
      ),
    );
  }
}
