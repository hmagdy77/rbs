import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> launchInBrowser(
    {required String host, required String path}) async {
  final Uri toLaunch = Uri(scheme: 'https', host: host, path: path);
  if (!await launchUrl(
    toLaunch,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $toLaunch');
  }
}

// ...

Future<void> launchUrlStr({required String url}) async {
  try {
    js.context.callMethod('open', [url]);
    // await launchUrlString(url, mode: LaunchMode.platformDefault);
  } catch (_) {}
}

Future<void> launchGoogleMaps({required String url}) async {
  try {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } catch (_) {}
}


// Future<void> openFacebook() async {
//   String fbProtocolUrl;
//   if (Platform.isIOS) {
//     fbProtocolUrl = 'fb://profile/{your-page-id}';
//   } else {
//     fbProtocolUrl = 'fb://page/{your-page-id}';
//   }

//   String fallbackUrl = 'https://www.facebook.com/{Golden.Sports.fym}';

//   try {
//     Uri fbBundleUri = Uri.parse(fbProtocolUrl);
//     var canLaunchNatively = await canLaunchUrl(fbBundleUri);

//     if (canLaunchNatively) {
//       launchUrl(fbBundleUri);
//     } else {
//       await launchUrl(Uri.parse(fallbackUrl),
//           mode: LaunchMode.externalApplication);
//     }
//   } catch (e) {
//     // Handle this as you prefer
//   }
// }

// // 2
// Future<void> openBrowser({required String url}) async {
//   var webUrl = url;
//   try {
//     await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
//   } catch (e) {
//     // Handle this as you prefer
//   }
// }
