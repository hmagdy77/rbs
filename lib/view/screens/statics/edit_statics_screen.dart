import '../../../libraries.dart';

class StaticsEditScreen extends StatelessWidget {
  StaticsEditScreen({super.key});
  final StaticsControllerImp staticsController =
      Get.find<StaticsControllerImp>();

  @override
  Widget build(BuildContext context) {
    Statics statics = ModalRoute.of(context)!.settings.arguments as Statics;
    return Scaffold(
      appBar: AppBar(),
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
                        text: AppStrings.edit,
                        onPressed: () {
                          staticsController.editStaticse(
                              statics: statics, context: context);
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
