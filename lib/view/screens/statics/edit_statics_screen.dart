  import '../../../libraries.dart';

class StaticsEditScreen extends StatelessWidget {
  const StaticsEditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Statics statics = ModalRoute.of(context)!.settings.arguments as Statics;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<StaticssCubit, StaticsState>(
              builder: (context, state) {
                var cubit = context.read<StaticssCubit>();
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
                        text: AppStrings.edit,
                        onPressed: () {
                          cubit.editStaticse(
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
