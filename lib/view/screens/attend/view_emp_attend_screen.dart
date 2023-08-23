
 import '../../../libraries.dart';
 
class AttendEmpScreen extends StatelessWidget {
  const AttendEmpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    var cubit = context.read<AttendCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(user.emp),
      ),
      body: BlocBuilder<AttendCubit, AttendState>(
        builder: (context, state) {
          if (state is AttendLoading) {
            return const MyLottieLoading();
          } else if (cubit.rangedAttend.isEmpty) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${AppStrings.to} ${cubit.endDate}'),
                    Text('${AppStrings.from} ${cubit.startDate}'),
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
                        Text(' ${AppStrings.to} ${cubit.endDate} '),
                        Text(' ${AppStrings.from} ${cubit.startDate} '),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.h02,
                    ),
                    const AttendItem(
                      kind: 2,
                      isHeader: true,
                    ),
                    for (var item in cubit.rangedAttend)
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                if (cubit.startDate.isEmpty || cubit.endDate.isEmpty) {
                  showSnakString(
                    context: context,
                    label: AppStrings.pleaseChoseDates,
                  );
                } else {
                  cubit.getAttendfromRange(
                    name: user.emp,
                  );
                }
              },
              child: const Icon(Icons.view_day),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                cubit.showDialog(
                  context: context,
                  child: SfDateRangePicker(
                    onSelectionChanged: (args) {
                      cubit.changeDate(date: args.value, kind: '3');
                    },
                    selectionMode: DateRangePickerSelectionMode.single,
                  ),
                );
              },
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                cubit.showDialog(
                  context: context,
                  child: SfDateRangePicker(
                    onSelectionChanged: (args) {
                      cubit.changeDate(date: args.value, kind: '2');
                    },
                    selectionMode: DateRangePickerSelectionMode.single,
                  ),
                );
              },
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
