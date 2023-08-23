 import '../../../libraries.dart';

class ReportsDesign extends StatelessWidget {
  const ReportsDesign({
    super.key,
    required this.agent,
    required this.cubit,
  });

  final Agent agent;
  final ReportsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return agent.dsCover == '0' && agent.dsFrame == '0' && agent.dsPosts == '0'
        ? const SizedBox()
        : MyExpandapleItem(
            label: AppStrings.design,
            child: Column(
              children: [
                agent.dsCover == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.dsCover,
                        sufIcon: const Icon(Icons.brush),
                        label: AppStrings.dsCover,
                      ),
                SizedBox(
                  height: AppSizes.h02,
                ),
                agent.dsFrame == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.dsFrame,
                        sufIcon: const Icon(Icons.brush),
                        label: AppStrings.dsFrame,
                      ),
                       SizedBox(
                  height: AppSizes.h02,
                ),
                agent.dsPosts == '0'
                    ? const SizedBox()
                    : MyNumberField(
                        controller: cubit.dsPosts,
                        sufIcon: const Icon(Icons.brush),
                        label: AppStrings.dsPosts,
                      ),
                      
              ],
            ),
          );
  }
}
