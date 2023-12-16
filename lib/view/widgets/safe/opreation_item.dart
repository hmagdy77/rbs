import 'package:intl/intl.dart';

import '../../../libraries.dart';
import '../statics/table_ciel.dart';

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
      return Center(
        child: Row(
          children: [
            MyCiel(
              style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
              isBack: false,
              isHeader: true,
              width: 1,
              text: AppStrings.desc,
            ),
            MyCiel(
              style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
              isBack: false,
              isHeader: true,
              width: 1,
              text: AppStrings.name,
            ),
            MyCiel(
              style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
              isBack: false,
              isHeader: true,
              width: 1,
              text: AppStrings.price,
            ),
            MyCiel(
              style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
              isBack: false,
              isHeader: true,
              width: 1,
              text: AppStrings.time,
            ),
            MyCiel(
              style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
              isBack: false,
              isHeader: true,
              width: 1,
              text: AppStrings.date,
            ),
            MyCiel(
              style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
              isBack: false,
              isHeader: true,
              width: 1,
              text: AppStrings.kind,
            ),
            MyCiel(
              style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
              isBack: false,
              isHeader: true,
              width: 1,
              text: AppStrings.delete,
            ),
          ],
        ),
      );
    } else {
      return Row(
        children: [
          MyCiel(
            style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
            isBack: false,
            isHeader: false,
            width: 1,
            text: opreation!.serviceDesc.maxLength(28),
          ),
          MyCiel(
            style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
            isBack: false,
            isHeader: false,
            width: 1,
            text: opreation!.serviceName.maxLength(16),
          ),
          MyCiel(
            style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
            isBack: false,
            isHeader: false,
            width: 1,
            text: opreation!.price,
          ),
          MyCiel(
            style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
            isBack: false,
            isHeader: false,
            width: 1,
            text: DateFormat.jm().format(opreation!.time),
          ),
          MyCiel(
            style: context.textTheme.displaySmall!.copyWith(fontSize: 12),
            isBack: false,
            isHeader: false,
            width: 1,
            text: formatter.format(opreation!.time),
          ),
          Expanded(
            flex: 1,
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
          Expanded(
            flex: 1,
            child: MyButton(
              text: AppStrings.delete,
              onPressed: onTap,
              widget: const Center(
                child: Icon(
                  Icons.delete,
                  color: AppColorManger.white,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
