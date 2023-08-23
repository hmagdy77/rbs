 
import '../../../libraries.dart';

class AlertsAddScreen extends StatelessWidget {
  const AlertsAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String kind = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          kind == '0'
              ? Text(
                  AppStrings.alerts,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : Text(
                  AppStrings.ideas,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
          Expanded(
            child: BlocBuilder<AlertsCubit, AlertsState>(
              builder: (context, state) {
                var cubit = context.read<AlertsCubit>();
                var usersCubit = context.read<UsersCubit>();
                var agentCubit = context.read<AgentsCubit>();
                if (state is AgentsLoading) {
                  return const Center(
                    child: MyLottieLoading(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        MyTextField(
                          hidePassword: false,
                          controller: cubit.title,
                          label: AppStrings.title,
                          sufIcon: const Icon(Icons.label),
                        ),
                        SizedBox(
                          height: AppSizes.h04,
                        ),
                        MyTextField(
                          hidePassword: false,
                          controller: cubit.content,
                          label: AppStrings.content,
                          sufIcon: const Icon(Icons.content_copy),
                          maxLines: 6,
                        ),
                        SizedBox(
                          height: AppSizes.h04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyButton(
                              text: AppStrings.add,
                              onPressed: () {
                                if (usersCubit.userName.isEmpty) {
                                  Navigator.pushNamed(
                                      context, AppRoutes.loginScreen);
                                } else if (cubit.title.text.isEmpty ||
                                    cubit.content.text.isEmpty ||
                                    agentCubit.selectedAgent.isEmpty) {
                                  showSnakString(
                                      context: context,
                                      label: AppStrings.pleaseEnterAllWanted);
                                } else {
                                  cubit.addAlert(
                                    agent: agentCubit.selectedAgent,
                                    creater: usersCubit.userName,
                                    context: context,
                                    kind: kind,
                                  );
                                }
                              },
                            ),
                            DropMenu(agentCubit: agentCubit),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DropMenu extends StatelessWidget {
  const DropMenu({
    super.key,
    required this.agentCubit,
  });

  final AgentsCubit agentCubit;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      // width: AppSizes.w5 * 2,
      enableFilter: true,
      leadingIcon: const Icon(Icons.search),
      label: agentCubit.selectedAgent.isEmpty
          ? Text(AppStrings.agentsChose,
              style: Theme.of(context).textTheme.displayMedium)
          : Text(agentCubit.selectedAgent,
              style: Theme.of(context).textTheme.displayMedium),
      dropdownMenuEntries: agentCubit.agentsMenu,
      textStyle: Theme.of(context).textTheme.displayMedium,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: (agent) {
        agentCubit.selectedAgent = agent!.name;
      },
    );
  }
}
