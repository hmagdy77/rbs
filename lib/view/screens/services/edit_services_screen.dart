import '../../../libraries.dart';

class ServicesEditScreen extends StatelessWidget {
  ServicesEditScreen({super.key});

  final ServicesControllerImp servicesController =
      Get.find()<ServicesControllerImp>();

  @override
  Widget build(BuildContext context) {
    ServiceM service = ModalRoute.of(context)!.settings.arguments as ServiceM;
    return Obx(
      () {
        if (servicesController.isLoading.value) {
          return const Center(
            child: MyLottieLoading(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(service.name),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: AppSizes.h03,
                  ),
                  MyTextField(
                    controller: servicesController.name,
                    sufIcon: const Icon(Icons.person),
                    label: AppStrings.name,
                    hidePassword: false,
                  ),
                  SizedBox(
                    height: AppSizes.h03,
                  ),
                  MyTextField(
                    controller: servicesController.desc,
                    sufIcon: const Icon(Icons.description),
                    label: AppStrings.desc,
                    hidePassword: false,
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: AppSizes.h03,
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      servicesController.editServicese(
                        context: context,
                        services: service,
                      );
                    },
                    child: const Icon(Icons.done),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      servicesController.deleteServices(
                        context: context,
                        id: service.id,
                      );
                    },
                    child: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
