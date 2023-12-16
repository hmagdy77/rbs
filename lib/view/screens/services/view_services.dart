import '../../../libraries.dart';
import '../../widgets/services/service_item.dart';

class ServicesViewScreen extends StatelessWidget {
  ServicesViewScreen({super.key});

  final ServicesControllerImp servicesController =
      Get.find()<ServicesControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: ScrolableWithChild(
          child: Obx(
            () {
              if (servicesController.isLoading.value) {
                return const Center(
                  child: MyLottieLoading(),
                );
              } else {
                return Column(
                  children: [
                    const ServiceSafeItem(
                      isHeader: true,
                    ),
                    for (var service in servicesController.allServicess)
                      ServiceSafeItem(
                        isHeader: false,
                        service: service,
                        onTap: () {
                          servicesController.prepareTextFields(
                              services: service);
                          Navigator.pushNamed(
                            context,
                            AppRoutes.servicesEditScreen,
                            arguments: service,
                          );
                        },
                      )
                  ],
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          servicesController.clearTextFields();
          Navigator.pushNamed(
            context,
            AppRoutes.servicesAddScreen,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
