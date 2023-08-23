 import '../../../libraries.dart';

class AddPaymentScreen extends StatelessWidget {
  const AddPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String kind = ModalRoute.of(context)!.settings.arguments as String;
    var opreationsCubit = context.read<OpreationsCubit>();
    var agentsCubit = context.read<AgentsCubit>();

    return Scaffold(
      appBar: AppBar(
          // title: Text(agent.name),
          ),
      body: Align(
        alignment: Alignment.topCenter,
        child: BlocBuilder<OpreationsCubit, OpreationsState>(
          builder: (context, state) {
            if (state is OpreationsLoading) {
              return const MyLottieLoading();
            } else {
              return Padding(
                padding: EdgeInsets.all(AppSizes.h01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    MyTextField(
                      hidePassword: false,
                      label: AppStrings.name,
                      sufIcon: const Icon(Icons.description),
                      controller: opreationsCubit.name,
                    ),
                    const Spacer(),
                    MyTextField(
                      hidePassword: false,
                      label: AppStrings.desc,
                      sufIcon: const Icon(Icons.description),
                      controller: opreationsCubit.description,
                    ),
                    const Spacer(),
                    MyNumberField(
                      controller: opreationsCubit.price,
                      label: AppStrings.price,
                      sufIcon: const Icon(FontAwesomeIcons.dollarSign),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            '${AppStrings.date} ${opreationsCubit.formatter.format(opreationsCubit.opreationTime)}'),
                        IconButton(
                          onPressed: () {
                            opreationsCubit.showDialog(
                              context: context,
                              child: SfDateRangePicker(
                                confirmText: 'Ok',
                                onSelectionChanged: (args) {
                                  opreationsCubit.changeDate(date: args.value);
                                },
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            color: AppColorManger.primary,
                            size: AppSizes.h03,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    MyButton(
                      text: AppStrings.add,
                      onPressed: () {
                        opreationsCubit.addPayment(
                          context: context,
                          serviceDesc: opreationsCubit.description.text,
                          serviceName: opreationsCubit.name.text,
                        );
                        agentsCubit.viewSafe(context: context);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
