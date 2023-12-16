// import '../../../libraries.dart';

// class NotificationIcon extends StatelessWidget {
//   NotificationIcon({
//     super.key,
//   });

//   final PostsControllerImp postsController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () {
//         if (postsController.alerts.isEmpty ||
//             postsController.alerts.first.end.difference(DateTime.now()).inDays <
//                 0) {
//           return const SizedBox();
//         } else if (postsController.alerts.first.id ==
//             postsController.myService.sharedPreferences
//                 .getInt(postsController.alertKey)
//                 .toString()) {
//           return IconButton(
//             onPressed: () {
//               Get.toNamed(AppRoutes.alertsScreen);
//             },
//             icon: const Icon(
//               Icons.notifications,
//             ),
//           );
//         } else {
//           return GestureDetector(
//             onTap: () {
//               postsController.makeSeen(
//                   id: int.parse(postsController.alerts.first.id));
//               Get.toNamed(AppRoutes.alertsScreen);
//             },
//             child: const MyLottieNotification(),
//           );
//           // IconButton(
//           //   onPressed: () {
//           //     postsController.makeSeen(
//           //         id: int.parse(postsController.alerts.first.id));
//           //     Get.toNamed(AppRoutes.alertsScreen);
//           //   },
//           //   icon: Stack(
//           //     children: [
//           //       const Icon(
//           //         Icons.notifications,
//           //       ),
//           //       Positioned(
//           //         child: CircleAvatar(
//           //           radius: AppSizes.h01 * .6,
//           //           backgroundColor: Colors.red,
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // );
//         }
//       },
//     );
//   }
// }
