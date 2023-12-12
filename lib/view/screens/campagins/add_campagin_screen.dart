import '../../../libraries.dart';

class CampaginAddScreen extends StatelessWidget {
  CampaginAddScreen({super.key});
  final CampaginsControllerImp campaginsController =
      Get.find<CampaginsControllerImp>();

  @override
  Widget build(BuildContext context) {
    var agent = ModalRoute.of(context)!.settings.arguments as Agent;

    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () {
                if (campaginsController.isLoading.value) {
                  return const Center(
                    child: MyLottieLoading(),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyTextField(
                        controller: campaginsController.name,
                        sufIcon: const Icon(Icons.person),
                        label: AppStrings.camaginName,
                        hidePassword: false,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyTextField(
                        controller: campaginsController.link,
                        sufIcon: const Icon(Icons.link),
                        label: AppStrings.camaginsLlink,
                        hidePassword: false,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  campaginsController.showDialog(
                                    context: context,
                                    child: SfDateRangePicker(
                                      onSelectionChanged: (args) {
                                        campaginsController.startDate.value =
                                            campaginsController.formatter
                                                .format(args.value);
                                        campaginsController.update();
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
                              campaginsController.startDate.isEmpty
                                  ? Text(AppStrings.startDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!)
                                  : Text(campaginsController.startDate.value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  campaginsController.showDialog(
                                    context: context,
                                    child: SfDateRangePicker(
                                      confirmText: 'Ok',
                                      onSelectionChanged: (args) {
                                        campaginsController.endDate.value =
                                            campaginsController.formatter
                                                .format(args.value);
                                        campaginsController.update();
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
                              campaginsController.endDate.isEmpty
                                  ? Text(AppStrings.endDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!)
                                  : Text(campaginsController.endDate.value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!),
                            ],
                          ),
                        ],
                      ),
                      MyButton(
                        minWidth: AppSizes.w3,
                        text: AppStrings.camaginsAdd,
                        onPressed: () {
                          if (campaginsController.startDate.isEmpty ||
                              campaginsController.endDate.isEmpty) {
                            MySnackBar.snack(AppStrings.faild, 'message');
                          } else {
                            campaginsController.addCampagin(
                              context: context,
                              agentName: agent.id,
                            );
                          }
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
