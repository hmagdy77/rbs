import '../../libraries.dart';

showSnak({required context, required int type}) {
  var snackBarSuc = SnackBar(
    content: const Center(child: Text(AppStrings.done)),
    backgroundColor: AppColorManger.backdark,
    duration: const Duration(seconds: 2),
    showCloseIcon: true,
    closeIconColor: AppColorManger.white,
    width: AppSizes.w4,
    padding: const EdgeInsets.symmetric(
      vertical: 25,
    ),
    behavior: SnackBarBehavior.floating,
  );
  var snackBarfail = SnackBar(
    content: const Center(child: Text(AppStrings.faild)),
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 2),
    showCloseIcon: true,
    closeIconColor: AppColorManger.white,
    width: AppSizes.w4,
    padding: const EdgeInsets.only(
      bottom: 50,
    ),
    behavior: SnackBarBehavior.floating,
  );
  if (type == 1) {
    ScaffoldMessenger.of(context).showSnackBar(snackBarSuc);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(snackBarfail);
  }
}

showSnakString({
  required context,
  required String label,
}) {
  var snackBarSuc = SnackBar(
    content: Center(child: Text(label)),
    backgroundColor: AppColorManger.backdark,
    duration: const Duration(seconds: 2),
    width: AppSizes.w4,
    padding: const EdgeInsets.symmetric(
      vertical: 25,
    ),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: AppColorManger.white,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBarSuc);
}

showSnakConfirm({
  required context,
  String? label,
  required VoidCallback onTap,
}) {
  var snackBarSuc = SnackBar(
    content: Center(
      child: MyButton(
        onPressed: onTap,
        text: label ?? AppStrings.confirmDelete,
        color: AppColorManger.grey,
      ),
    ),
    backgroundColor: AppColorManger.primary,
    width: AppSizes.w3,
    showCloseIcon: true,
    padding: const EdgeInsets.symmetric(
      vertical: 25,
    ),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.up,
    closeIconColor: AppColorManger.white,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBarSuc);
}
