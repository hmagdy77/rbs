import '../../../libraries.dart';

class MyDrawerButton extends StatelessWidget {
  const MyDrawerButton({super.key, required this.label, required this.ontap});
  final String label;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      onPressed: ontap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      visualDensity: VisualDensity.comfortable,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
        // width: double.infinity,
        decoration: BoxDecoration(
          color: AppColorManger.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: AppColorManger.white),
          ),
        ),
      ),
    );
  }
}
