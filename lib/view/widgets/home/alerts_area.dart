import '../../../libraries.dart';

class AlertsArea extends StatelessWidget {
  AlertsArea({super.key});
  final AlertsControllerImp alertsController = Get.find<AlertsControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorManger.greyLight,
      child: Obx(
        () {
          if (alertsController.isLoading.value) {
            return const Center(
              child: SizedBox(),
            );
          } else {
            if (alertsController.newAlerts.isEmpty) {
              return const SizedBox();
            } else {
              return Padding(
                padding: EdgeInsets.only(top: AppSizes.h02),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var alert = alertsController.newAlerts[index];
                    return AlertsWidget(
                      alert: alert,
                    );
                  },
                  itemCount: alertsController.newAlerts.length,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
