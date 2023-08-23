import '../../../libraries.dart';

class CampaginAddScreen extends StatelessWidget {
  const CampaginAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var agent = ModalRoute.of(context)!.settings.arguments as Agent;

    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<CampaginsCubit, CampaginState>(
              builder: (context, state) {
                var cubit = context.read<CampaginsCubit>();
                if (state is CampaginLoading) {
                  return const Center(
                    child: MyLottieLoading(),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyTextField(
                        controller: cubit.name,
                        sufIcon: const Icon(Icons.person),
                        label: AppStrings.camaginName,
                        hidePassword: false,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      MyTextField(
                        controller: cubit.link,
                        sufIcon: const Icon(Icons.link),
                        label: AppStrings.camaginsLlink,
                        hidePassword: false,
                      ),
                      SizedBox(
                        height: AppSizes.h03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              cubit.endDate.isEmpty
                                  ? Text(AppStrings.endDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!)
                                  : Text(cubit.endDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!),
                              IconButton(
                                onPressed: () {
                                  cubit.showDialog(
                                    context: context,
                                    child: SfDateRangePicker(
                                      confirmText: 'Ok',
                                      onSelectionChanged: (args) {
                                        cubit.endDate =
                                            cubit.formatter.format(args.value);
                                        cubit.changeState();
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
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              cubit.startDate.isEmpty
                                  ? Text(AppStrings.startDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!)
                                  : Text(cubit.startDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!),
                              IconButton(
                                onPressed: () {
                                  cubit.showDialog(
                                    context: context,
                                    child: SfDateRangePicker(
                                      onSelectionChanged: (args) {
                                        cubit.startDate =
                                            cubit.formatter.format(args.value);
                                        cubit.changeState();
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
                              )
                            ],
                          ),
                        ],
                      ),
                      MyButton(
                        minWidth: AppSizes.w3,
                        text: AppStrings.camaginsAdd,
                        onPressed: () {
                          if (cubit.startDate.isEmpty ||
                              cubit.endDate.isEmpty) {
                            showSnak(context: context, type: 0);
                          } else {
                            cubit.addCampagin(
                                context: context, agentName: agent.id);
                          }
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
