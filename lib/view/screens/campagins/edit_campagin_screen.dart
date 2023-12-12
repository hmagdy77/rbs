import '../../../libraries.dart';

class CampaginEditScreen extends StatelessWidget {
  CampaginEditScreen({super.key});
  final CampaginsControllerImp campaginsController =
      Get.find<CampaginsControllerImp>();
  @override
  Widget build(BuildContext context) {
    Campagin campagin = ModalRoute.of(context)!.settings.arguments as Campagin;
    return Scaffold(
        appBar: AppBar(
          title: Text(campagin.name),
          actions: [
            IconButton(
              onPressed: () {
                campaginsController.editCampagine(
                  campagin: campagin,
                  context: context,
                );
              },
              icon: const Icon(Icons.done),
            ),
            IconButton(
              onPressed: () {
                campaginsController.deleteCampagin(
                  context: context,
                  id: campagin.id,
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Obx(
          () {
            if (campaginsController.isLoading.value) {
              return const Center(
                child: MyLottieLoading(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
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
                                      campagin.startDate = args.value;
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
                            Text(
                                '${AppStrings.startDate} : ${campaginsController.formatter.format(campagin.startDate)}',
                                style:
                                    Theme.of(context).textTheme.displayMedium!),
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
                                      campagin.endDate = args.value;
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
                            Text(
                                '${AppStrings.endDate} : ${campaginsController.formatter.format(campagin.endDate)}',
                                style:
                                    Theme.of(context).textTheme.displayMedium!),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
