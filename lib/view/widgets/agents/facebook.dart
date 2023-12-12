import '../../../libraries.dart';

class FaceBookWidget extends StatelessWidget {
  const FaceBookWidget({
    super.key,
    required this.fbPosts,
    required this.fbRells,
    required this.fbStorys,
    required this.fbVideos,
  });
  final TextEditingController fbPosts;
  final TextEditingController fbRells;
  final TextEditingController fbStorys;
  final TextEditingController fbVideos;
  @override
  Widget build(BuildContext context) {
    return MyExpandapleItem(
      label: AppStrings.facebook,
      child: Column(
        children: [
          MyNumberField(
            controller: fbPosts,
            sufIcon: const Icon(Icons.facebook),
            label: AppStrings.fbPosts,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: fbRells,
            sufIcon: const Icon(Icons.facebook),
            label: AppStrings.fbRells,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: fbStorys,
            sufIcon: const Icon(Icons.facebook),
            label: AppStrings.fbStorys,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: fbVideos,
            sufIcon: const Icon(Icons.facebook),
            label: AppStrings.fbVideos,
          ),
        ],
      ),
    );
  }
}
