// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rbs_android/firebase_options.dart';

import 'controllers/theme/theme_controller.dart';
import 'libraries.dart';
import 'my_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
    );
    return GetMaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('ar'),
      ],
      locale: const Locale('ar'), //controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Right Business Solutions',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeController().getThemeMode,
      initialBinding: AppBindings(),
      getPages: getRoutes!,
    );
  }
}
