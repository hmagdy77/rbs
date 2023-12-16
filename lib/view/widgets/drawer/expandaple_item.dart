import '../../../libraries.dart';

class MyExpandapleItem extends StatelessWidget {
  const MyExpandapleItem({
    Key? key,
    required this.child,
    required this.label,
    this.header,
    this.color,
    this.labelStyle,
  }) : super(key: key);

  final String label;
  final TextStyle? labelStyle;
  final Widget child;
  final Widget? header;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      decoration: BoxDecoration(
        color: color ?? AppColorManger.backdark,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.h02),
          bottomRight: Radius.circular(AppSizes.h02),
          topLeft: Radius.circular(AppSizes.h02),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          alignment: Alignment.topRight,
          collapseIcon: Icons.remove,
          iconColor: AppColorManger.primary,
          bodyAlignment: ExpandablePanelBodyAlignment.right,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
        ),
        header: header ??
            Text(
              label,
              textAlign: TextAlign.start,
              style: labelStyle ??
                  Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColorManger.white),
            ),
        collapsed: const SizedBox(),
        expanded: child,
      ),
    );
  }
}
