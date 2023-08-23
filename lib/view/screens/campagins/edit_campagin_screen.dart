 import '../../../libraries.dart';

class CampaginEditScreen extends StatelessWidget {
  const CampaginEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Campagin campagin = ModalRoute.of(context)!.settings.arguments as Campagin;
    return BlocBuilder<CampaginsCubit, CampaginState>(
      builder: (context, state) {
        var cubit = context.read<CampaginsCubit>();
        if (state is CampaginLoading) {
          return const Center(
            child: MyLottieLoading(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(campagin.name),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                      Text(
                          '${AppStrings.endDate} : ${cubit.formatter.format(campagin.endDate)}',
                          style: Theme.of(context).textTheme.displayMedium!),
                      IconButton(
                        onPressed: () {
                          cubit.showDialog(
                            context: context,
                            child: SfDateRangePicker(
                              confirmText: 'Ok',
                              onSelectionChanged: (args) {
                                campagin.endDate = args.value;
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
                      Text(
                          '${AppStrings.startDate} : ${cubit.formatter.format(campagin.startDate)}',
                          style: Theme.of(context).textTheme.displayMedium!),
                      IconButton(
                        onPressed: () {
                          cubit.showDialog(
                            context: context,
                            child: SfDateRangePicker(
                              onSelectionChanged: (args) {
                                campagin.startDate = args.value;
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
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      cubit.editCampagine(
                        campagin: campagin,
                        context: context,
                      );
                    },
                    child: const Icon(Icons.done),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      cubit.deleteCampagin(
                        context: context,
                        id: campagin.id,
                      );
                    },
                    child: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
