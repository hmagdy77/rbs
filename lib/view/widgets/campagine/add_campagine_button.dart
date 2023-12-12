import '../../../libraries.dart';

class AddCampagineButton extends StatelessWidget {
  const AddCampagineButton({
    super.key,
    required this.agent,
  });

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.campaginAddScreen,
          arguments: agent,
        );
      },
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: AppSizes.h01,
          horizontal: AppSizes.h02,
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColorManger.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: AppSizes.h1,
              color: AppColorManger.white,
            ),
            Text(
              AppStrings.camaginsAdd,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: AppColorManger.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
