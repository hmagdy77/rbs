import '../../../../libraries.dart';

class AddPaymentScreen extends StatelessWidget {
  AddPaymentScreen({super.key});
  final OpreationsControllerImp opreationsController =
      Get.find<OpreationsControllerImp>();
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(agent.name),
          ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Obx(
          () {
            if (opreationsController.isLoading.value ||
                agentsController.isLoading.value) {
              return const MyLottieLoading();
            } else {
              return Padding(
                padding: EdgeInsets.all(AppSizes.h01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    MyTextField(
                      hidePassword: false,
                      label: AppStrings.name,
                      sufIcon: const Icon(Icons.description),
                      controller: opreationsController.name,
                    ),
                    const Spacer(),
                    MyTextField(
                      hidePassword: false,
                      label: AppStrings.desc,
                      sufIcon: const Icon(Icons.description),
                      controller: opreationsController.description,
                    ),
                    const Spacer(),
                    MyNumberField(
                      controller: opreationsController.price,
                      label: AppStrings.price,
                      sufIcon: const Icon(FontAwesomeIcons.dollarSign),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            '${AppStrings.date} ${opreationsController.formatter.format(opreationsController.opreationTime)}'),
                        IconButton(
                          onPressed: () {
                            opreationsController.showDialog(
                              context: context,
                              child: SfDateRangePicker(
                                confirmText: 'Ok',
                                onSelectionChanged: (args) {
                                  opreationsController.changeDate(
                                      date: args.value);
                                },
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            color: AppColorManger.primary,
                            size: AppSizes.h03,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    MyButton(
                      text: AppStrings.add,
                      onPressed: () {
                        opreationsController.addPayment(
                          context: context,
                          serviceDesc: opreationsController.description.text,
                          serviceName: opreationsController.name.text,
                        );
                        agentsController.viewSafe();
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
