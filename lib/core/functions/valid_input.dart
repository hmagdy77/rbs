import '../constants/app_strings.dart';

validInput({
  required String type,
  required String val,
  required int min,
  required int max,
}) {
  // if (type == AppStrings.validateAdminNum) {
  //   if (!GetUtils.isNum(val)) {
  //     return AppStrings.notValidPhone;
  //   }
  // }
  if (type == AppStrings.validateAdmin) {
    if (val.isEmpty) {
      return AppStrings.cantBeEmpty;
    }
    if (val.length > max) {
      return '${AppStrings.cantBeMore} $max';
    }
    if (val.length < min) {
      return '${AppStrings.cantBeLess} $min';
    }
  }

  if (val.isEmpty) {
    return AppStrings.cantBeEmpty;
  }
  if (val.length > max) {
    return '${AppStrings.cantBeMore} $max';
  }
  if (val.length < min) {
    return '${AppStrings.cantBeLess} $min';
  }
}
