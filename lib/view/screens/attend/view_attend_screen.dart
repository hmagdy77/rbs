import '../../../libraries.dart';

class AttendViewScreen extends StatelessWidget {
  const AttendViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AttendControllerImp attendController =
        Get.find<AttendControllerImp>();
    final UsersControllerImp usersController = Get.find<UsersControllerImp>();

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: ScrolableWithChild(
          child: Column(
            children: [
              EmpItems(
                usersController: usersController,
                attendController: attendController,
              ),
              SizedBox(
                height: AppSizes.h04,
              ),
              AttendItems(
                attendController: attendController,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          attendController.showDialog(
            context: context,
            child: SfDateRangePicker(
              onSelectionChanged: (args) {
                attendController.changeDate(date: args.value, kind: '1');
                attendController.viewAttend(date: args.value);
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
    required this.attendController,
  });

  final AttendControllerImp attendController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (attendController.isLoading.value) {
          return const MyLottieLoading();
        } else {
          return Column(
            children: [
              attendController.selectedDate.isEmpty
                  ? Text(
                      '${AppStrings.date} ${attendController.formatter.format(DateTime.now())}')
                  : Text('${AppStrings.date} ${attendController.selectedDate}'),
              const AttendItem(
                kind: 1,
                isHeader: true,
              ),
              for (var item in attendController.dayAttend)
                AttendItem(
                  attend: item,
                  kind: 1,
                  isHeader: false,
                )
            ],
          );
        }
      },
    );
  }
}

class EmpItems extends StatelessWidget {
  const EmpItems({
    super.key,
    required this.usersController,
    required this.attendController,
  });

  final UsersControllerImp usersController;
  final AttendControllerImp attendController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: AppSizes.h2,
      child: Obx(
        () {
          if (usersController.isLoading.value) {
            return const MyLottieLoading();
          } else {
            return Row(
              children: [
                for (var emp in usersController.allUsers)
                  GestureDetector(
                    onTap: () {
                      attendController.rangedAttend.clear();
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
          }
        },
      ),
    );
  }
}
