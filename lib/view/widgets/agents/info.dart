 import '../../../libraries.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentsCubit, AgentsState>(
      builder: (context, state) {
        var cubit = context.read<AgentsCubit>();
        return MyExpandapleItem(
          label: AppStrings.informations,
          child: Column(
            children: [
              MyTextField(
                controller: cubit.name,
                sufIcon: const Icon(Icons.person),
                label: AppStrings.name,
                hidePassword: false,
              ),
              SizedBox(
                height: AppSizes.h02,
              ),
              MyNumberField(
                controller: cubit.phone1,
                sufIcon: const Icon(FontAwesomeIcons.phone),
                label: AppStrings.phone1,
              ),
              SizedBox(
                height: AppSizes.h02,
              ),
              MyNumberField(
                controller: cubit.phone2,
                sufIcon: const Icon(FontAwesomeIcons.phone),
                label: AppStrings.phone2,
              ),
              SizedBox(
                height: AppSizes.h02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${AppStrings.renewalDate} : ${cubit.renewalDate}',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColorManger.white),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.showDialog(
                        context: context,
                        child: SfDateRangePicker(
                          confirmText: 'Ok',
                          onSelectionChanged: (args) {
                            cubit.changeDate(date: args.value);
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
      },
    );
  }
}
