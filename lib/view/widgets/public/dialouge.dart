import '../../../libraries.dart';

myDialuge({
  required Function confirm,
  required String title,
  Widget? content,
}) {
  return Get.defaultDialog(
    title: title,
    // middleText: middleText,
    backgroundColor: Get.theme.primaryColor,
    buttonColor: Get.theme.scaffoldBackgroundColor,
    titleStyle:
        Get.textTheme.displayLarge!.copyWith(color: AppColorManger.white),
    middleTextStyle: Get.textTheme.bodySmall,
    radius: 10,
    cancelTextColor: Get.theme.primaryColorDark,
    confirmTextColor: Get.theme.primaryColorLight,
    textConfirm: AppStrings.yes,
    textCancel: AppStrings.no,
    onConfirm: () {
      confirm();
    },
    onCancel: () {},
    content: content ?? Container(),
  );
}
