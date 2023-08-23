 import '../../../libraries.dart';

class HomeSafeScreen extends StatelessWidget {
  const HomeSafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ScrolableWithChild(
          child: Column(
            children: [
              BlocBuilder<AgentsCubit, AgentsState>(
                builder: (context, state) {
                  var cubit = context.read<AgentsCubit>();
                  if (state is AgentsInit) {
                    cubit.getAgents(context: context);
                    return const Center(
                      child: MyLottieLoading(),
                    );
                  } else if (state is AgentsLoading) {
                    return const Center(
                      child: MyLottieLoading(),
                    );
                  } else if (state is AgentsSucsses) {
                    return Column(
                      children: [
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        Text(
                          '${AppStrings.debtBalance} : ${cubit.agentAccSum}',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          '${AppStrings.safePayment} : ${cubit.safeList[0].value}',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        const AgentSafeItem(
                          isHeader: true,
                        ),
                        for (var agent in cubit.allAgents)
                          AgentSafeItem(
                            isHeader: false,
                            agent: agent,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.agentSafeDetailsScreen,
                                arguments: agent,
                              );
                            },
                          )
                      ],
                    );
                  } else if (state is AgentsError) {
                    return const MyLottieInternet();
                  } else {
                    cubit.getAgents(context: context);
                    return const Center(
                      child: MyLottieInternet(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.viewPaymentScreen);
        },
        child: const Icon(Icons.payment),
      ),
    );
  }
}
