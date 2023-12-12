import '../../../../libraries.dart';

class AddOpreationScreen extends StatelessWidget {
  AddOpreationScreen({super.key});
  final OpreationsControllerImp opreationsController =
      Get.find<OpreationsControllerImp>();
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();
  final Agent agent = Get.arguments[0];
  final String kind = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
      ),
      body: Obx(
        () {
          if (opreationsController.isLoading.value) {
            return const MyLottieLoading();
          } else {
            return Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.h01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    kind != '1'
                        ? MyTextField(
                            hidePassword: false,
                            label: AppStrings.name,
                            sufIcon: const Icon(Icons.description),
                            controller: opreationsController.name,
                          )
                        : const SizedBox(),
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
                      onPressed: () async {
                        await opreationsController.addOpreation(
                          agent: agent,
                          context: context,
                          serviceDesc: opreationsController.description.text,
                          serviceName: kind == '1'
                              ? AppStrings.cash
                              : opreationsController.name.text,
                          kind: kind,
                        );
                        await agentsController.updateAgentAcc(
                          id: agent.id,
                          account: kind == '1'
                              ? '-${opreationsController.price.text}'
                              : opreationsController.price.text,
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
