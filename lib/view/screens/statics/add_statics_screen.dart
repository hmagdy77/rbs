import '../../../libraries.dart';

class StaticsAddScreen extends StatelessWidget {
  StaticsAddScreen({super.key});

  final StaticsControllerImp staticsController =
      Get.find<StaticsControllerImp>();
  final UsersControllerImp usersController = Get.find<UsersControllerImp>();

  @override
  Widget build(BuildContext context) {
    var camagin = ModalRoute.of(context)!.settings.arguments as Campagin;

    return Scaffold(
      appBar: AppBar(
        title: Text(camagin.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () {
                if (staticsController.isLoading.value) {
                  return const Center(
                    child: MyLottieLoading(),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyNumberField(
                        controller: staticsController.messages,
                        sufIcon: const Icon(Icons.link),
                        label: AppStrings.messages,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyNumberField(
                        controller: staticsController.comments,
                        sufIcon: const Icon(Icons.link),
                        label: AppStrings.comments,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyNumberField(
                        controller: staticsController.likes,
                        sufIcon: const Icon(Icons.link),
                        label: AppStrings.likes,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyNumberField(
                        controller: staticsController.reach,
                        sufIcon: const Icon(Icons.link),
                        label: AppStrings.reach,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyButton(
                        minWidth: AppSizes.w3,
                        text: AppStrings.camaginAddStatic,
                        onPressed: () {
                          if (usersController.userName.isEmpty) {
                            Navigator.pushNamed(context, AppRoutes.loginScreen);
                          } else {
                            staticsController.addStatics(
                              byEmp: usersController.userName,
                              campaignId: camagin.id,
                              context: context,
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
