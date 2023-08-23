import 'package:intl/intl.dart';
import 'package:rbs/libraries.dart';

class MyTableStatics extends StatelessWidget {
  MyTableStatics({
    super.key,
    this.statics,
    this.onTap,
    required this.isHeader,
    required this.isSum,
    this.comments,
    this.likes,
    this.reach,
    this.message,
    this.startDate,
    this.endDate,
  });
  final Statics? statics;
  final bool isHeader;
  final bool isSum;
  final int? comments;
  final int? likes;
  final int? reach;
  final int? message;
  final String? startDate;
  final String? endDate;
  final VoidCallback? onTap;
  final formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    if (isSum) {
      return Center(
        child: Row(
          children: [
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 150,
              text: comments.toString(),
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 150,
              text: likes.toString(),
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 150,
              text: reach.toString(),
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 150,
              text: message.toString(),
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 200,
              text: '${AppStrings.to} ${endDate.toString()}',
            ),
            MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 200,
              text: '${AppStrings.from} ${startDate.toString()}',
            ),
            const MyCielFixed(
              isBack: false,
              isHeader: true,
              width: 150,
              text: AppStrings.sum,
            ),
          ],
        ),
      );
    } else {
      if (isHeader) {
        return const Center(
          child: Row(
            children: [
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 150,
                text: AppStrings.comments,
              ),
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 150,
                text: AppStrings.likes,
              ),
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 150,
                text: AppStrings.reach,
              ),
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 150,
                text: AppStrings.messages,
              ),
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 200,
                text: AppStrings.publishDate,
              ),
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 200,
                text: AppStrings.by,
              ),
              MyCielFixed(
                isBack: false,
                isHeader: true,
                width: 150,
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
              width: 150,
              text: statics!.comments,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: false,
              width: 150,
              text: statics!.likes,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: false,
              width: 150,
              text: statics!.reach,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: false,
              width: 150,
              text: statics!.messages,
            ),
            MyCielFixed(
              isBack: false,
              isHeader: false,
              width: 200,
              text: formatter.format(statics!.date),
            ),
            MyCielFixed(
              isBack: false,
              isHeader: false,
              width: 200,
              text: statics!.byEmp,
            ),
            SizedBox(
              width: 150,
              child: MyButton(text: AppStrings.delete, onPressed: onTap),
            ),
            // MyCielFixed(
            //   isBack: false,
            //   isHeader: false,
            //   text: statics!.byEmp,
            //   width: 150,
            //   child: MyButton(
            //     text: AppStrings.delete,
            //     onPressed: onTap,
            //   ),
            // ),
          ],
        );
      }
    }
  }
}

// myService.sharedPreferences.getInt(MyStrings.adminKey) == 1
          //     ? MyCielFixed(
          //         isBack: false,
          //         isHeader: false,
          //         width: 150,
          //         text: Statics!.StaticsPriceIn.toString(),
          //       )
          //     : Container(),
         