import '../../../libraries.dart';

class MySnackBar {
  static SnackbarController snack(String title, String message) {
    return Get.rawSnackbar(
      margin: EdgeInsets.all(AppSizes.h2),
      titleText: Center(
        child: Text(
          message,
          style: Get.textTheme.displayMedium!
              .copyWith(color: AppColorManger.white),
        ),
      ),
      messageText: Center(
        child: Text(
          title,
          style: Get.textTheme.displayMedium!
              .copyWith(color: AppColorManger.white),
        ),
      ),
      backgroundColor: Get.theme.primaryColor,
      duration: const Duration(seconds: 2),
      borderRadius: 10,
    );
  }
}
