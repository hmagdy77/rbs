 import '../../../libraries.dart';
 
class AlertsViewScreen extends StatelessWidget {
  const AlertsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String kind = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: kind == '2'
            ? const Text(AppStrings.ideas)
            : const Text(AppStrings.alerts),
      ),
      body: Column(
        children: [
          SizedBox(
            height: AppSizes.h02,
          ),
          Expanded(
            child: BlocBuilder<AlertsCubit, AlertsState>(
              builder: (context, state) {
                var cubit = context.read<AlertsCubit>();
                if (state is AlertsInit) {
                  cubit.getAlerts();
                  return const Center(
                    child: MyLottieLoading(),
                  );
                } else if (state is AlertsLoading) {
                  return const Center(
                    child: MyLottieLoading(),
                  );
                } else if (state is AlertsSucsses) {
                  if (cubit.allAlerts.isEmpty) {
                    return const MyLottieEmpty();
                  } else if (kind == '2') {
                    List<Alert> list = cubit.ideas;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var alert = list[index];
                        return AlertsWidget(
                          alert: alert,
                          onTap: () {},
                        );
                      },
                      itemCount: list.length,
                    );
                  } else {
                    List<Alert> list = cubit.alerts;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var alert = list[index];
                        return AlertsWidget(
                          alert: alert,
                          onTap: () {},
                        );
                      },
                      itemCount: list.length,
                    );
                  }
                } else if (state is AlertsError) {
                  return const MyLottieInternet();
                } else {
                  cubit.getAlerts();
                  return const Center(
                    child: MyLottieInternet(),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.alertsAddScreen,
            arguments: kind,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
