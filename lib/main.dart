import 'libraries.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AgentsCubit()),
        BlocProvider(create: (_) => CampaginsCubit()),
        BlocProvider(create: (_) => StaticssCubit()),
        BlocProvider(create: (_) => ReportsCubit()),
        BlocProvider(create: (_) => AlertsCubit()),
        BlocProvider(create: (_) => UsersCubit()),
        BlocProvider(create: (_) => AttendCubit()),
        BlocProvider(create: (_) => OpreationsCubit()),
        BlocProvider(create: (_) => ServicesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        theme: AppTheme.light,
        routes: routes,
        initialRoute: AppRoutes.mainRoot,
      ),
    );
  }
}
