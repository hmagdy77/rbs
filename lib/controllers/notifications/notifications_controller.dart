import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  @override
  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic('magdy');
    fcmConfig();
    setupInteractedMessage();
    super.onInit();
  }

  fcmConfig() async {
    // ignore: unused_local_variable
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      announcement: false,
      provisional: false,
      criticalAlert: false,
    );
    FirebaseMessaging.onMessage.listen(
      (event) {
        Get.snackbar(
          event.notification!.title!,
          event.notification!.body!,
          duration: const Duration(seconds: 100),
        );
      },
    );
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      reciveMessageWhenAppTerminated(initialMessage);
    }
    // FirebaseMessaging.onMessageOpenedApp.listen(reciveMessageWhenAppTerminated);
  }

  void reciveMessageWhenAppTerminated(RemoteMessage message) {
    // if (message.data["pageid"] == "2") {
    //   Get.toNamed(AppRoutes.offerScreen);
    // } else if (message.data["pageid"] == "3") {
    //   Get.toNamed(AppRoutes.newsScreen);
    // } else if (message.data["pageid"] == "4") {
    //   makeSeen(id: int.parse(alerts.first.id));
    //   Get.toNamed(AppRoutes.alertsScreen);
    // }
  }

  // void showSnack({required context, required String title}) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(
  //         title,
  //         textAlign: TextAlign.center,
  //         style: Get.textTheme.displayMedium!
  //             .copyWith(color: AppColorManger.lightScaffold),
  //       ),
  //       margin: EdgeInsets.symmetric(
  //         horizontal: AppSizes.w02,
  //         vertical: AppSizes.h05,
  //       ),
  //       padding: EdgeInsets.all(AppSizes.h01),
  //       behavior: SnackBarBehavior.floating,
  //       backgroundColor: AppColorManger.primary,
  //     ),
  //   );
  // }
}
