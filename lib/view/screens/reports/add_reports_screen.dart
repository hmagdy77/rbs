 import '../../../libraries.dart';

class ReportsAddScreen extends StatelessWidget {
  const ReportsAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var agent = ModalRoute.of(context)!.settings.arguments as Agent;

    return Scaffold(
      appBar: AppBar(title: Text(agent.name)),
      body: ListView(
        children: [
          BlocBuilder<ReportsCubit, ReportsState>(
            builder: (context, state) {
              var cubit = context.read<ReportsCubit>();
              var usersCubit = context.read<UsersCubit>();
              if (state is ReportsStateLoading) {
                return const Center(
                  child: MyLottieLoading(),
                );
              } else {
                return Column(
                  children: [
                    //  MyExpandapleItem
                    ReportsFaceBook(agent: agent, cubit: cubit),
                    ReportsInstagram(agent: agent, cubit: cubit),
                    ReportsWebSite(agent: agent, cubit: cubit),
                    ReportsYouTube(agent: agent, cubit: cubit),
                    ReportsDesign(agent: agent, cubit: cubit),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(
                          minWidth: AppSizes.w3,
                          text: AppStrings.add,
                          onPressed: () {
                            if (usersCubit.userName.isEmpty) {
                              Navigator.pushNamed(
                                  context, AppRoutes.loginScreen);
                            } else {
                              cubit.addReport(
                                  byEmp: usersCubit.userName,
                                  context: context,
                                  agentId: agent.id);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}
