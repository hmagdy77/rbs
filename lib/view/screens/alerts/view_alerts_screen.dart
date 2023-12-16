import '../../../libraries.dart';

class AlertsViewScreen extends StatelessWidget {
  AlertsViewScreen({super.key, required this.kind});
  final String kind;
  final AlertsControllerImp alertsController = Get.find<AlertsControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: AppSizes.h02,
          ),
          Expanded(child: Obx(
            () {
              if (alertsController.isLoading.value) {
                return const Center(
                  child: MyLottieLoading(),
                );
              } else {
                if (alertsController.allAlerts.isEmpty) {
                  return const MyLottieEmpty();
                } else if (kind == '2') {
                  List<Alert> list = alertsController.ideas;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var alert = list[index];
                      return AlertsWidget(
                        alert: alert,
                        onTap: () {},
                      );
                    },
                    itemCount: list.length,
                  );
                } else {
                  List<Alert> list = alertsController.alerts;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var alert = list[index];
                      return AlertsWidget(
                        alert: alert,
                        onTap: () {},
                      );
                    },
                    itemCount: list.length,
                  );
                }
              }
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.alertsAddScreen,
            arguments: kind,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
