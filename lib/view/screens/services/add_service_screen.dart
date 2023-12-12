import '../../../libraries.dart';

class ServicesAddScreen extends StatelessWidget {
  ServicesAddScreen({super.key});
  final ServicesControllerImp servicesController =
      Get.find()<ServicesControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.services),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () {
                if (servicesController.isLoading.value) {
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
                      MyButton(
                        minWidth: AppSizes.w3,
                        text: AppStrings.add,
                        onPressed: () {
                          if (servicesController.name.text.isEmpty ||
                              servicesController.desc.text.isEmpty) {
                            MySnackBar.snack(AppStrings.faild, 'message');
                          } else {
                            servicesController.addServices(context: context);
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
