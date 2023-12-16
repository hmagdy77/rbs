import '../../../libraries.dart';

class WebSiteWidget extends StatelessWidget {
  const WebSiteWidget({
    super.key,
    required this.wbVideos,
    required this.wbBlog,
    required this.wbphotos,
  });
  final TextEditingController wbVideos;
  final TextEditingController wbBlog;
  final TextEditingController wbphotos;

  @override
  Widget build(BuildContext context) {
    return MyExpandapleItem(
      label: AppStrings.website,
      child: Column(
        children: [
          MyNumberField(
            controller: wbVideos,
            sufIcon: const Icon(FontAwesomeIcons.internetExplorer),
            label: AppStrings.wbVideos,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: wbBlog,
            sufIcon: const Icon(FontAwesomeIcons.internetExplorer),
            label: AppStrings.wbBlog,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: wbphotos,
            sufIcon: const Icon(FontAwesomeIcons.internetExplorer),
            label: AppStrings.wbphotos,
          ),
        ],
      ),
    );
  }
}
