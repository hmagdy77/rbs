import '../../../libraries.dart';

class DrawerColumn extends StatelessWidget {
  const DrawerColumn({Key? key, required this.agent}) : super(key: key);
  final Agent agent;
  @override
  Widget build(BuildContext context) {
    final ReportsControllerImp reportsController =
        Get.find<ReportsControllerImp>();
    final CampaginsControllerImp campaginsCubit =
        Get.find<CampaginsControllerImp>();

    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColorManger.primary,
      width: AppSizes.w5,
      child: ListView(
        children: [
          MyExpandapleItem(
            label: AppStrings.camagins,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                MyDrawerButton(
                  label: AppStrings.camaginsAdd,
                  ontap: () {
                    campaginsCubit.clearTextFields();
                    Navigator.pushNamed(
                      context,
                      AppRoutes.campaginAddScreen,
                      arguments: agent,
                    );
                  },
                ),
                MyDrawerButton(
                  label: AppStrings.camaginsView,
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.campaginViewScreen,
                      arguments: agent,
                    );
                  },
                ),
              ],
            ),
          ),
          MyExpandapleItem(
            label: AppStrings.reports,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                MyDrawerButton(
                  label: AppStrings.reportsAdd,
                  ontap: () {
                    reportsController.clearTextFields();
                    Navigator.pushNamed(
                      context,
                      AppRoutes.reportsAddScreen,
                      arguments: agent,
                    );
                  },
                ),
                MyDrawerButton(
                  label: AppStrings.reportsView,
                  ontap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.reportsViewScreen,
                      arguments: agent,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
