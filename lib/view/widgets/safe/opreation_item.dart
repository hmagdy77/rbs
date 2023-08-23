import 'package:intl/intl.dart';
import 'package:rbs/libraries.dart';

class MyTableOpreation extends StatelessWidget {
  MyTableOpreation({
    super.key,
    this.opreation,
    this.onTap,
    required this.isHeader,
  });
  final Opreation? opreation;
  final bool isHeader;
  final VoidCallback? onTap;
  final formatter = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    if (isHeader) {
      return const Center(
        child: Row(
          children: [
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 350,
              text: AppStrings.desc,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 250,
              text: AppStrings.name,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 150,
              text: AppStrings.price,
            ),
            MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 150,
                text: AppStrings.time),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 200,
              text: AppStrings.date,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 100,
              text: AppStrings.kind,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 100,
              text: AppStrings.delete,
            ),
          ],
        ),
      );
    } else {
      return Row(
        children: [
          MyCielFixed(
            isBack: false,
            isHeader: false,
            width: 350,
            text: opreation!.serviceDesc.maxLength(28),
          ),
          MyCielFixed(
            isBack: false,
            isHeader: false,
            width: 250,
            text: opreation!.serviceName.maxLength(16),
          ),
          MyCielFixed(
            isBack: false,
            isHeader: false,
            width: 150,
            text: opreation!.price,
          ),
          MyCielFixed(
            isBack: false,
            isHeader: false,
            width: 150,
            text: DateFormat.jm().format(opreation!.time),
          ),
          MyCielFixed(
            isBack: false,
            isHeader: false,
            width: 200,
            text: formatter.format(opreation!.time),
          ),
          SizedBox(
            width: 100,
            child: CircleAvatar(
              backgroundColor: opreation!.kind == '1'
                  ? AppColorManger.primary
                  : AppColorManger.red,
              child: opreation!.kind == '1'
                  ? const Icon(
                      Icons.arrow_downward,
                      color: AppColorManger.white,
                    )
                  : const Icon(
                      Icons.arrow_upward,
                      color: AppColorManger.white,
                    ),
            ),
          ),
          SizedBox(
            width: 100,
            child: MyButton(
              text: AppStrings.delete,
              onPressed: onTap,
            ),
          ),
        ],
      );
    }
  }
}
