import 'package:intl/intl.dart';

import '../../../../core/print/pdf_accounts.dart';
import '../../../../libraries.dart';

class AgentSafeDetailsScreen extends StatelessWidget {
  AgentSafeDetailsScreen({super.key});
  final OpreationsControllerImp opreationsController =
      Get.find<OpreationsControllerImp>();
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();
  final UsersControllerImp usersController = Get.find<UsersControllerImp>();

  final Agent agent = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
        actions: [
          // Start
          IconButton(
            onPressed: () {
              opreationsController.showDialog(
                context: context,
                child: SfDateRangePicker(
                  onSelectionChanged: (args) {
                    opreationsController.changeDateForRange(
                        date: args.value, kind: '1');
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          // end
          IconButton(
            onPressed: () {
              opreationsController.showDialog(
                context: context,
                child: SfDateRangePicker(
                  onSelectionChanged: (args) {
                    opreationsController.changeDateForRange(
                        date: args.value, kind: '2');
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () {
              if (opreationsController.startDate.isEmpty ||
                  opreationsController.endDate.isEmpty) {
                showSnakString(
                  context: context,
                  label: AppStrings.pleaseChoseDates,
                );
              } else {
                opreationsController.getOpreationsfromRange(
                  agentId: int.parse(agent.id),
                );
              }
            },
            icon: const Icon(Icons.get_app_rounded),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ScrolableWithChild(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    onPressed: () {
                      opreationsController.clearTextFields();
                      Get.toNamed(
                        AppRoutes.addOpreationScreen,
                        arguments: [agent, '1'],
                      );
                    },
                    text: AppStrings.sdad,
                  ),
                  SizedBox(
                    width: AppSizes.w01,
                  ),
                  MyButton(
                    onPressed: () {
                      opreationsController.clearTextFields();
                      Get.toNamed(
                        AppRoutes.addOpreationScreen,
                        arguments: [agent, '0'],
                      );
                    },
                    text: AppStrings.service,
                  ),
                ],
              ),
              Obx(
                () {
                  opreationsController.sortOpreations(id: agent.id);
                  if (opreationsController.allOpreations.isEmpty) {
                    opreationsController.getOpreations();
                    opreationsController.sortOpreations(id: agent.id);
                    return const MyLottieEmpty();
                  } else if (opreationsController.isLoading.value) {
                    return const MyLottieLoading();
                  } else {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                ' ${AppStrings.from} ${DateFormat.yMMMEd().format(opreationsController.startDateView.value)}    '),
                            Text(
                                ' ${AppStrings.to} ${DateFormat.yMMMEd().format(opreationsController.endDateView.value)}'),
                          ],
                        ),
                        Text('${AppStrings.agentAcc} : ${agent.account}'),
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        MyTableOpreation(isHeader: true),
                        for (var item in opreationsController.rangedOpreations)
                          MyTableOpreation(
                            isHeader: false,
                            opreation: item,
                            onTap: () async {
                              await opreationsController.deleteOpreation(
                                  id: item.id);
                              await agentsController.updateAgentAcc(
                                id: item.agent,
                                account: item.kind == '1'
                                    ? item.price
                                    : (-double.parse(item.price)).toString(),
                              );
                              if (item.kind == '1') {
                                await agentsController.updateSafe(
                                  value: (-double.parse(item.price)).toString(),
                                );
                              }
                            },
                          )
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
          printFunc();
        },
        child: const Icon(Icons.print),
      ),
    );
  }

  printFunc() async {
    opreationsController.printItems.clear();
    List opreations = opreationsController.rangedOpreations;
    for (int i = 0; i < opreations.length; i++) {
      opreationsController.printItems.add(
        [
          opreations[i].price,
          DateFormat.yMd().format(opreations[i].time),
          opreations[i].serviceDesc,
          opreations[i].serviceName
        ],
      );
    }
    printAccounts(
      items: opreationsController.printItems,
      agentName: agent.name,
      rewnableDate: agent.renewalDate.day.toString(),
      start: opreationsController.startDate.value,
      end: opreationsController.endDate.value,
      emp: usersController.userName,
    );
  }
}
