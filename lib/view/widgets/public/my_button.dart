import '../../../libraries.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      this.widget,
      this.text,
      this.onPressed,
      this.minWidth,
      this.color,
      this.margin})
      : super(key: key);
  final String? text;
  final double? minWidth;
  final double? margin;
  final void Function()? onPressed;
  final Widget? widget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppSizes.h06,
        //width: AppSizes.w25,
        margin: EdgeInsets.all(margin ?? 12),
        child: MaterialButton(
          minWidth: minWidth ?? AppSizes.w25,
          onPressed: onPressed,
          color: color ?? AppColorManger.primary,
          hoverColor: AppColorManger.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: widget ??
              Text(
                text!,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColorManger.white,
                    ),
              ),
        ),
      ),
    );
  }
}
