import '../../../libraries.dart';

class InstgramWidget extends StatelessWidget {
  const InstgramWidget({
    super.key,
    required this.insPosts,
    required this.insRells,
    required this.insStorys,
    required this.insVideos,
    required this.insHighlight,
  });
  final TextEditingController insPosts;
  final TextEditingController insRells;
  final TextEditingController insStorys;
  final TextEditingController insVideos;
  final TextEditingController insHighlight;

  @override
  Widget build(BuildContext context) {
    return MyExpandapleItem(
      label: AppStrings.instgram,
      child: Column(
        children: [
          MyNumberField(
            controller: insPosts,
            sufIcon: const Icon(FontAwesomeIcons.instagram),
            label: AppStrings.insPosts,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: insRells,
            sufIcon: const Icon(FontAwesomeIcons.instagram),
            label: AppStrings.insRells,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: insStorys,
            sufIcon: const Icon(FontAwesomeIcons.instagram),
            label: AppStrings.insStorys,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: insVideos,
            sufIcon: const Icon(FontAwesomeIcons.instagram),
            label: AppStrings.insVideos,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: insHighlight,
            sufIcon: const Icon(FontAwesomeIcons.instagram),
            label: AppStrings.insHighlight,
          ),
        ],
      ),
    );
  }
}
