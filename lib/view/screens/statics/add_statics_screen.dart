 import '../../../libraries.dart';

class StaticsAddScreen extends StatelessWidget {
  const StaticsAddScreen({super.key});

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
            child: BlocBuilder<StaticssCubit, StaticsState>(
              builder: (context, state) {
                var cubit = context.read<StaticssCubit>();
                var usersCubit = context.read<UsersCubit>();
                if (state is StaticsLoading) {
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
                        controller: cubit.messages,
                        sufIcon: const Icon(Icons.link),
                        label: AppStrings.messages,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyNumberField(
                        controller: cubit.comments,
                        sufIcon: const Icon(Icons.link),
                        label: AppStrings.comments,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyNumberField(
                        controller: cubit.likes,
                        sufIcon: const Icon(Icons.link),
                        label: AppStrings.likes,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyNumberField(
                        controller: cubit.reach,
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
                          if (usersCubit.userName.isEmpty) {
                            Navigator.pushNamed(context, AppRoutes.loginScreen);
                          } else {
                            cubit.addStatics(
                              byEmp: usersCubit.userName,
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
