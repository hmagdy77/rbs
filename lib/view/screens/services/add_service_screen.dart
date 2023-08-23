 import '../../../libraries.dart';

class ServicesAddScreen extends StatelessWidget {
  const ServicesAddScreen({super.key});

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
            child: BlocBuilder<ServicesCubit, ServicesState>(
              builder: (context, state) {
                var cubit = context.read<ServicesCubit>();
                if (state is ServicesLoading) {
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
                        controller: cubit.name,
                        sufIcon: const Icon(Icons.person),
                        label: AppStrings.name,
                        hidePassword: false,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyTextField(
                        controller: cubit.desc,
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
                          if (cubit.name.text.isEmpty ||
                              cubit.desc.text.isEmpty) {
                            showSnak(context: context, type: 0);
                          } else {
                            cubit.addServices(context: context);
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
