import 'package:intl/intl.dart';

import '../../../libraries.dart';

class AlertsWidget extends StatelessWidget {
  AlertsWidget({super.key, required this.alert, this.onTap});
  final Alert alert;
  final Function()? onTap;
  final formatter = DateFormat('yyyy-MM-dd hh:mm');
  final AlertsControllerImp alertsController = Get.find<AlertsControllerImp>();
  final UsersControllerImp usersController = Get.find<UsersControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: AppColorManger.primary,
        border: Border.all(color: AppColorManger.backdark, width: 2),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    alert.title,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColorManger.white,
                        ),
                  ),
                  Text(
                    alert.agent,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColorManger.white,
                        ),
                  ),
                ],
              ),
              Stack(
                children: [
                  SelectionArea(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(width: 2, color: AppColorManger.white),
                      ),
                      child: Text(
                        alert.content,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: AppColorManger.white,
                                  decoration: TextDecoration.underline,
                                ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: 1,
                    child: IconButton(
                      onPressed: () {
                        launchInBrowser(
                          url: alert.content,
                        );
                      },
                      icon: const Icon(
                        FontAwesomeIcons.internetExplorer,
                        color: AppColorManger.white,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                '${formatter.format(alert.createdAt)} : ${AppStrings.createdAt}',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColorManger.white,
                    ),
              ),
              // DateFormat("h:mma")
              Text(
                ' ${alert.creater} : ${AppStrings.by}',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColorManger.white,
                    ),
              ),
              alert.seen == '1'
                  ? Text(
                      '${formatter.format(alert.seenAt)} : ${AppStrings.acceptedAt}',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: AppColorManger.white,
                          ),
                    )
                  : const SizedBox(),
              alert.seen == '1'
                  ? Text(
                      ' ${alert.reciver} : ${AppStrings.seenBy}',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: AppColorManger.white,
                          ),
                    )
                  : const SizedBox(),
              alert.seen == '0'
                  ? MyButton(
                      text: AppStrings.accept,
                      onPressed: () {
                        alertsController.makeSeen(
                          reciver: usersController.userName,
                          id: alert.id,
                          context: context,
                        );
                      },
                      color: AppColorManger.backdark,
                    )
                  : const SizedBox(),
              usersController.userType == 1
                  ? MyButton(
                      text: AppStrings.delete,
                      color: AppColorManger.backdark,
                      onPressed: () {
                        alertsController.deleteAlert(
                          id: alert.id,
                          context: context,
                        );
                      },
                    )
                  : const SizedBox(),
            ],
          ),
          alert.seen == '1'
              ? const Positioned(
                  top: 0,
                  left: 0,
                  child: CircleAvatar(
                    backgroundColor: AppColorManger.white,
                    child: Icon(
                      Icons.done,
                      color: AppColorManger.primary,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
