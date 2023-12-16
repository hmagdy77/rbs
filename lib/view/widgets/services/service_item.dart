import '../../../libraries.dart';

class ServiceSafeItem extends StatelessWidget {
  const ServiceSafeItem({
    super.key,
    this.service,
    this.onTap,
    required this.isHeader,
  });
  final ServiceM? service;
  final bool isHeader;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    if (isHeader) {
      return const Center(
        child: Row(
          children: [
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 150,
              text: AppStrings.edit,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 350,
              text: AppStrings.desc,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 200,
              text: AppStrings.name,
            ),
          ],
        ),
      );
    } else {
      return Row(
        children: [
          SizedBox(
            width: 150,
            child: MyButton(text: AppStrings.edit, onPressed: onTap),
          ),
          MyCielFixed(
            isBack: false,
            isHeader: false,
            width: 350,
            text: service!.desc.maxLength(28),
          ),
          MyCielFixed(
            isBack: false,
            isHeader: false,
            width: 200,
            text: service!.name,
          ),
          // MyCielFixed(
          //   isBack: false,
          //   isHeader: false,
          //   text: '',
          //   width: 200,
          //   child: MyButton(
          //     text: AppStrings.mange,
          //     onPressed: onTap,
          //   ),
          // ),
        ],
      );
    }
  }
}
