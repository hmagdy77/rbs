import '../../../libraries.dart';

class CampagineItem extends StatelessWidget {
  const CampagineItem({
    super.key,
    required this.campagin,
    required this.ontap1,
    required this.ontap2,
    required this.ontap3,
    required this.onChanged,
  });
  final Campagin campagin;
  final VoidCallback ontap1;
  final VoidCallback ontap2;
  final VoidCallback ontap3;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.h01),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: campagin.active == '1'
            ? AppColorManger.primary
            : AppColorManger.primarySecond,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            campagin.name,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColorManger.white,
                ),
            textAlign: TextAlign.center,
          ),
          Switch.adaptive(
            value: campagin.active == '1' ? true : false,
            onChanged: onChanged,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: ontap3,
                icon: const Icon(
                  Icons.menu,
                  size: 35,
                  color: AppColorManger.white,
                ),
              ),
              IconButton(
                onPressed: ontap1,
                icon: const Icon(
                  Icons.edit,
                  size: 35,
                  color: AppColorManger.white,
                ),
              ),
              IconButton(
                onPressed: ontap2,
                icon: const Icon(
                  FontAwesomeIcons.internetExplorer,
                  size: 35,
                  color: AppColorManger.white,
                ),
              ),
            ],
          ),
          // MyButton(
          //   text: AppStrings.camaginEdit,
          //   onPressed: ontap1,
          // ),
          // MyButton(
          //   text: AppStrings.camaginAddStatic,
          //   onPressed: ontap2,
          // ),
          // MyButton(
          //   text: AppStrings.allStatics,
          //   onPressed: ontap3,
          // ),
        ],
      ),
    );
  }
}
