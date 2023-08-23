 
 import '../../../libraries.dart';

class AlertsArea extends StatelessWidget {
  const AlertsArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorManger.greyLight,
      width: AppSizes.w4,
      child: BlocBuilder<AlertsCubit, AlertsState>(
        builder: (context, state) {
          // var usersCubit = context.read<UsersCubit>();
          var cubit = context.read<AlertsCubit>();
          if (state is AlertsInit) {
            cubit.getAlerts();
            return const Center(
              child: SizedBox(),
            );
          } else if (state is AlertsLoading) {
            return const Center(
              child: SizedBox(),
            );
          } else if (state is AlertsSucsses) {
            if (cubit.newAlerts.isEmpty) {
              return const SizedBox();
            } else {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var alert = cubit.newAlerts[index];
                  return AlertsWidget(
                    alert: alert,
                  );
                },
                itemCount: cubit.newAlerts.length,
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
    );
  }
}
