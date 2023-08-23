import '../../../libraries.dart';

class DesignWidget extends StatelessWidget {
  const DesignWidget({
    super.key,
    required this.dsPosts,
    required this.dsFrame,
    required this.dsCover,
  });
  final TextEditingController dsPosts;
  final TextEditingController dsFrame;

  final TextEditingController dsCover;

  @override
  Widget build(BuildContext context) {
    return MyExpandapleItem(
      label: AppStrings.design,
      child: Column(
        children: [
          MyNumberField(
            controller: dsPosts,
            sufIcon: const Icon(FontAwesomeIcons.paintbrush),
            label: AppStrings.dsPosts,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: dsFrame,
            sufIcon: const Icon(FontAwesomeIcons.paintbrush),
            label: AppStrings.dsFrame,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: dsCover,
            sufIcon: const Icon(FontAwesomeIcons.paintbrush),
            label: AppStrings.dsCover,
          ),
        ],
      ),
    );
  }
}
