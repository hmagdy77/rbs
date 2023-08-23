import '../../../libraries.dart';

class AttendViewScreen extends StatelessWidget {
  const AttendViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var attendCubit = context.read<AttendCubit>();
    var usersCubit = context.read<UsersCubit>();
    String label = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ScrolableWithChild(
          child: Column(
            children: [
              EmpItems(
                usersCubit: usersCubit,
                attendCubit: attendCubit,
              ),
              SizedBox(
                height: AppSizes.h04,
              ),
              AttendItems(
                attendCubit: attendCubit,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          attendCubit.showDialog(
            context: context,
            child: SfDateRangePicker(
              onSelectionChanged: (args) {
                attendCubit.changeDate(date: args.value, kind: '1');
                attendCubit.viewAttend(date: args.value);
              },
              selectionMode: DateRangePickerSelectionMode.single,
            ),
          );
        },
        child: const Icon(Icons.calendar_month),
      ),
    );
  }
}

class AttendItems extends StatelessWidget {
  const AttendItems({
    super.key,
    required this.attendCubit,
  });

  final AttendCubit attendCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendCubit, AttendState>(
      builder: (context, state) {
        if (state is AttendSucsses) {
          return Column(
            children: [
              attendCubit.selectedDate.isEmpty
                  ? Text(
                      '${AppStrings.date} ${attendCubit.formatter.format(DateTime.now())}')
                  : Text('${AppStrings.date} ${attendCubit.selectedDate}'),
              const AttendItem(
                kind: 1,
                isHeader: true,
              ),
              for (var item in attendCubit.dayAttend)
                AttendItem(
                  attend: item,
                  kind: 1,
                  isHeader: false,
                )
            ],
          );
        } else if (state is AttendFail) {
          return Center(
            child: Column(
              children: [
                Text('${AppStrings.date} ${attendCubit.selectedDate}'),
                const MyLottieEmpty(),
              ],
            ),
          );
        } else {
          return const Center(
            child: MyLottieLoading(),
          );
        }
      },
    );
  }
}

class EmpItems extends StatelessWidget {
  const EmpItems({
    super.key,
    required this.usersCubit,
    required this.attendCubit,
  });

  final UsersCubit usersCubit;
  final AttendCubit attendCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: AppSizes.h2,
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersInit) {
            usersCubit.viewUsers();
            return const Text('');
          } else if (state is UsersLoading) {
            return const MyLottieLoading();
          } else if (state is UsersSucsses) {
            return Row(
              children: [
                for (var emp in usersCubit.allUsers)
                  GestureDetector(
                    onTap: () {
                      attendCubit.rangedAttend.clear();
                      Navigator.pushNamed(
                        context,
                        AppRoutes.attendEmpScreen,
                        arguments: emp,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: AppSizes.h1,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColorManger.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          emp.emp,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: AppColorManger.white,
                              ),
                        ),
                      ),
                    ),
                  )
              ],
            );

            // ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder: (context, index) {
            //     return GestureDetector(
            //       onTap: () {
            //         Navigator.pushNamed(
            //           context,
            //           AppRoutes.attendEmpScreen,
            //           arguments: usersCubit.allUsers[index],
            //         );
            //       },
            //       child: Container(
            //         margin: const EdgeInsets.all(10),
            //         padding: const EdgeInsets.all(10),
            //         height: AppSizes.h1,
            //         width: 200,
            //         decoration: BoxDecoration(
            //           color: AppColorManger.primary,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Center(
            //           child: Text(
            //             usersCubit.allUsers[index].emp,
            //             style:
            //                 Theme.of(context).textTheme.displayMedium!.copyWith(
            //                       color: AppColorManger.white,
            //                     ),
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            //   itemCount: usersCubit.allUsers.length,
            // );
          } else {
            usersCubit.viewUsers();
            return const Text('');
          }
        },
      ),
    );
  }
}
