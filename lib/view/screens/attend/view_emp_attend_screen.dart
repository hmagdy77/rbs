import '../../../libraries.dart';

class AttendEmpScreen extends StatelessWidget {
  const AttendEmpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    final AttendControllerImp attendController =
        Get.find<AttendControllerImp>();

    return Scaffold(
      appBar: AppBar(
        title: Text(user.emp),
        actions: [
          IconButton(
            onPressed: () {
              attendController.showDialog(
                context: context,
                child: SfDateRangePicker(
                  onSelectionChanged: (args) {
                    attendController.changeDate(date: args.value, kind: '2');
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              attendController.showDialog(
                context: context,
                child: SfDateRangePicker(
                  onSelectionChanged: (args) {
                    attendController.changeDate(date: args.value, kind: '3');
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () {
              if (attendController.startDate.isEmpty ||
                  attendController.endDate.isEmpty) {
                showSnakString(
                  context: context,
                  label: AppStrings.pleaseChoseDates,
                );
              } else {
                attendController.getAttendfromRange(
                  name: user.emp,
                );
              }
            },
            icon: const Icon(Icons.view_day),
          ),
        ],
      ),
      body: Obx(
        () {
          if (attendController.isLoading.value) {
            return const MyLottieLoading();
          } else if (attendController.rangedAttend.isEmpty) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${AppStrings.from} ${attendController.startDate}'),
                    Text('${AppStrings.to} ${attendController.endDate}'),
                  ],
                ),
                const MyLottieEmpty(),
              ],
            );
          } else {
            return Center(
              child: ScrolableWithChild(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            ' ${AppStrings.from} ${attendController.startDate} '),
                        Text(' ${AppStrings.to} ${attendController.endDate} '),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.h02,
                    ),
                    const AttendItem(
                      kind: 2,
                      isHeader: true,
                    ),
                    for (var item in attendController.rangedAttend)
                      AttendItem(
                        attend: item,
                        kind: 2,
                        isHeader: false,
                      ),
                    // cubit.rangedAttend.isEmpty
                    //     ? const Expanded(child: MyLottieEmpty())
                    //     : ListView.builder(
                    //         physics: const NeverScrollableScrollPhysics(),
                    //         shrinkWrap: true,
                    //         itemCount: cubit.rangedAttend.length,
                    //         itemBuilder: (context, index) {
                    //           return AttendItem(
                    //             attend: cubit.rangedAttend[index],
                    //             kind: 2,
                    //             isHeader: false,
                    //           );
                    //         },
                    //       ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
