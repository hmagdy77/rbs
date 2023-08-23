 import '../../../libraries.dart';
 import '../../widgets/services/service_item.dart';

class ServicesViewScreen extends StatelessWidget {
  const ServicesViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var servicesCubit = context.read<ServicesCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: ScrolableWithChild(
          child: BlocBuilder<ServicesCubit, ServicesState>(
            builder: (context, state) {
              if (state is ServicesInit) {
                servicesCubit.getServicess();
                return const Center(
                  child: MyLottieLoading(),
                );
              } else if (state is ServicesLoading) {
                return const Center(
                  child: MyLottieLoading(),
                );
              } else if (state is ServicesSucsses) {
                return Column(
                  children: [
                    const ServiceSafeItem(
                      isHeader: true,
                    ),
                    for (var service in servicesCubit.allServicess)
                      ServiceSafeItem(
                        isHeader: false,
                        service: service,
                        onTap: () {
                          servicesCubit.prepareTextFields(services: service);
                          Navigator.pushNamed(
                            context,
                            AppRoutes.servicesEditScreen,
                            arguments: service,
                          );
                        },
                      )
                  ],
                );
              } else if (state is ServicesError) {
                return const MyLottieInternet();
              } else {
                servicesCubit.getServicess();
                return const Center(
                  child: MyLottieInternet(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          servicesCubit.clearTextFields();
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
