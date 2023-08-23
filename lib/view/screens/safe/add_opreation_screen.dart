 import '../../../libraries.dart';

class AddOpreationScreen extends StatelessWidget {
  const AddOpreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List arguments = ModalRoute.of(context)!.settings.arguments as List;
    Agent agent = arguments[0];
    String kind = arguments[1];
    var opreationsCubit = context.read<OpreationsCubit>();
    var agentsCubit = context.read<AgentsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
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
                    kind != '1'
                        ? MyTextField(
                            hidePassword: false,
                            label: AppStrings.name,
                            sufIcon: const Icon(Icons.description),
                            controller: opreationsCubit.name,
                          )
                        : const SizedBox(),
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
                        opreationsCubit.addOpreation(
                          agent: agent,
                          context: context,
                          serviceDesc: opreationsCubit.description.text,
                          serviceName: kind == '1'
                              ? AppStrings.cash
                              : opreationsCubit.name.text,
                          kind: kind,
                        );
                        agentsCubit.updateAgentAcc(
                          id: agent.id,
                          account: kind == '1'
                              ? '-${opreationsCubit.price.text}'
                              : opreationsCubit.price.text,
                          context: context,
                        );
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
