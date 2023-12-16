import '../../../libraries.dart';

class AgentItem extends StatelessWidget {
  AgentItem({
    super.key,
    required this.agent,
    required this.value,
    required this.ontap,
    required this.onChanged,
  });
  final Agent agent;
  final VoidCallback ontap;
  final Function(bool)? onChanged;
  final bool value;
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      hoverColor: AppColorManger.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: ontap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: AppSizes.h01),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: agentsController.checkDate(agent: agent)
                  ? AppColorManger.red
                  : AppColorManger.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MyImage(
                      url: '${Api.agentsViewImage}/${agent.image}',
                      // height: AppSizes.h1,
                      width: double.infinity),
                ),
                Row(
                  children: [
                    Switch.adaptive(
                      value: value,
                      onChanged: onChanged,
                      activeColor: Colors.yellowAccent,
                      inactiveTrackColor: Colors.white,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        agent.name, //.maxLength(8),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppColorManger.white),
                      ),
                    ),
                  ],
                ),
                Text(
                  agent.renewalDate.day.toString(), //.maxLength(8),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColorManger.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 2,
            left: 2,
            // child: agent.renewalDate.day == DateTime.now().day ||
            //         agent.renewalDate.day == DateTime.now().day - 1 ||
            //         agent.renewalDate.day == DateTime.now().day - 2 ||
            //         agent.renewalDate.day == DateTime.now().day - 3
            child: agentsController.checkDate(agent: agent)
                ? const MyLottieNotification()
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
