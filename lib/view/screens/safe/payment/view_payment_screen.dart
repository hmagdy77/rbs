import '../../../../libraries.dart';

class ViewPaymentScreen extends StatelessWidget {
  ViewPaymentScreen({super.key});
  final OpreationsControllerImp opreationsController =
      Get.find<OpreationsControllerImp>();
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.payment),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ScrolableWithChild(
          child: Column(
            children: [
              Obx(
                () {
                  // opreationsController.sortOpreations(id: '0');
                  if (agentsController.isLoading.value) {
                    return const MyLottieLoading();
                  } else {
                    return Column(
                      children: [
                        const Text(AppStrings.payment),
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        MyTableOpreation(isHeader: true),
                        for (var item in opreationsController.paymentOpreations)
                          MyTableOpreation(
                            isHeader: false,
                            opreation: item,
                            onTap: () async {
                              await opreationsController.deleteOpreation(
                                  id: item.id);
                              await agentsController.updateSafe(
                                  value: item.price);
                            },
                          ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          opreationsController.clearTextFields();
          Navigator.pushNamed(
            context,
            AppRoutes.addPaymentScreen,
          );
        },
        child: const Icon(FontAwesomeIcons.dollarSign),
      ),
    );
  }
}
