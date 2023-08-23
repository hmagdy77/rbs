 import '../../../libraries.dart';

class ServicesEditScreen extends StatelessWidget {
  const ServicesEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceM service = ModalRoute.of(context)!.settings.arguments as ServiceM;
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        var cubit = context.read<ServicesCubit>();
        if (state is ServicesLoading) {
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
                      cubit.editServicese(
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
                      cubit.deleteServices(
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
