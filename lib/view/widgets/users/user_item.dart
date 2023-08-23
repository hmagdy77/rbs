import '../../../libraries.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, this.user, required this.kind, this.ontap});
  final User? user;
  final int kind;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    if (kind == 1) {
      return const Row(
        children: [
          MyCielFixed(
            text: AppStrings.edit,
            isHeader: true,
            width: 150,
            isBack: false,
          ),
          MyCielFixed(
            text: AppStrings.premisson,
            isHeader: true,
            width: 150,
            isBack: false,
          ),
          MyCielFixed(
            text: AppStrings.password,
            isHeader: true,
            width: 150,
            isBack: false,
          ),
          MyCielFixed(
            text: AppStrings.userName,
            isHeader: true,
            width: 200,
            isBack: false,
          ),
          MyCielFixed(
            text: AppStrings.name,
            isHeader: true,
            width: 200,
            isBack: false,
          ),
        ],
      );
    } else {
      return Row(
        children: [
          SizedBox(
            width: 150,
            child: MyButton(text: AppStrings.edit, onPressed: ontap),
          ),
          MyCielFixed(
            text: user!.userAdmin == '1' ? AppStrings.admin : AppStrings.user,
            isHeader: false,
            width: 150,
            isBack: false,
          ),
          MyCielFixed(
            text: user!.userPassword,
            isHeader: false,
            width: 150,
            isBack: false,
          ),
          MyCielFixed(
            text: user!.userName,
            isHeader: false,
            width: 200,
            isBack: false,
          ),
          MyCielFixed(
            text: user!.emp,
            isHeader: false,
            width: 200,
            isBack: false,
          ),
        ],
      );
    }
  }
}
