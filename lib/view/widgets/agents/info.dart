import '../../../libraries.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget({
    super.key,
  });
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return MyExpandapleItem(
      label: AppStrings.informations,
      child: Column(
        children: [
          MyTextField(
            controller: agentsController.name,
            sufIcon: const Icon(Icons.person),
            label: AppStrings.name,
            hidePassword: false,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: agentsController.phone1,
            sufIcon: const Icon(FontAwesomeIcons.phone),
            label: AppStrings.phone1,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: agentsController.phone2,
            sufIcon: const Icon(FontAwesomeIcons.phone),
            label: AppStrings.phone2,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          MyNumberField(
            controller: agentsController.renewalValue,
            sufIcon: const Icon(FontAwesomeIcons.dollarSign),
            label: AppStrings.renewalValue,
          ),
          SizedBox(
            height: AppSizes.h02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${AppStrings.renewalDate} : ${agentsController.renewalDate}',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColorManger.white),
              ),
              IconButton(
                onPressed: () {
                  agentsController.showDialog(
                    context: context,
                    child: SfDateRangePicker(
                      confirmText: 'Ok',
                      onSelectionChanged: (args) {
                        agentsController.changeDate(date: args.value);
                      },
                      selectionMode: DateRangePickerSelectionMode.single,
                    ),
                  );
                },
                icon: Icon(
                  Icons.calendar_month,
                  color: AppColorManger.white,
                  size: AppSizes.h03,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
