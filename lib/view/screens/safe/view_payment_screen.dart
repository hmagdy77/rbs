 import '../../../libraries.dart';
 
class ViewPaymentScreen extends StatelessWidget {
  const ViewPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OpreationsCubit>();
    var agentsCubit = context.read<AgentsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.payment),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ScrolableWithChild(
          child: Column(
            children: [
              BlocBuilder<OpreationsCubit, OpreationsState>(
                builder: (context, state) {
                  cubit.sortOpreations(id: '0');
                  if (cubit.allOpreations.isEmpty ||
                      state is OpreationsChanged) {
                    cubit.getOpreations(id: '0');
                    return const MyLottieLoading();
                  } else if (state is OpreationsLoading) {
                    return const MyLottieLoading();
                  } else if (state is OpreationsFail) {
                    return const MyLottieEmpty();
                  } else {
                    return Column(
                      children: [
                        const Text(AppStrings.payment),
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        MyTableOpreation(isHeader: true),
                        for (var item in cubit.paymentOpreations)
                          MyTableOpreation(
                            isHeader: false,
                            opreation: item,
                            onTap: () {
                              cubit.deleteOpreation(
                                  id: item.id, context: context);
                              agentsCubit.updateSafe(value: item.price);
                            },
                          ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.clearTextFields();
          Navigator.pushNamed(
            context,
            AppRoutes.addPaymentScreen,
          );
        },
        child: const Icon(FontAwesomeIcons.dollarSign),
      ),
    );
  }
}
