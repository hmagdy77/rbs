import 'package:get/get_navigation/src/routes/get_route.dart';

import 'view/screens/agent_details_screen.dart';
import 'view/screens/agents/add_agents_screen.dart';
import 'view/screens/agents/edit_agents_screen.dart';
import 'view/screens/alerts/add_alerts_screen.dart';
import 'view/screens/alerts/view_alerts_screen.dart';
import 'view/screens/attend/view_attend_screen.dart';
import 'view/screens/attend/view_emp_attend_screen.dart';
import 'view/screens/campagins/add_campagin_screen.dart';
import 'view/screens/campagins/edit_campagin_screen.dart';
import 'view/screens/campagins/view_active_campagin.dart';
import 'view/screens/campagins/view_campagin.dart';
import 'view/screens/home_screen.dart';
import 'view/screens/ip_address_screen.dart';
import 'view/screens/loading_screen.dart';
import 'view/screens/reports/add_reports_screen.dart';
import 'view/screens/reports/edit_reports_screen.dart';
import 'view/screens/reports/reports_area.dart';
import 'view/screens/reports/view_reports.dart';
import 'view/screens/safe/agent/add_opreation_screen.dart';
import 'view/screens/safe/agent/agent_safe_details_screen.dart';
import 'view/screens/safe/home_safe_screen.dart';
import 'view/screens/safe/payment/add_payment_screen.dart';
import 'view/screens/safe/payment/view_payment_screen.dart';
import 'view/screens/services/add_service_screen.dart';
import 'view/screens/services/edit_services_screen.dart';
import 'view/screens/services/view_services.dart';
import 'view/screens/splash_screen.dart';
import 'view/screens/statics/add_statics_screen.dart';
import 'view/screens/statics/edit_statics_screen.dart';
import 'view/screens/statics/view_statics_screen.dart';
import 'view/screens/users/add_users_screen.dart';
import 'view/screens/users/edit_users_screen.dart';
import 'view/screens/users/login_screen.dart';
import 'view/screens/users/view_users_screen.dart';

List<GetPage<dynamic>>? getRoutes = [
  //************************main Screens************************

  GetPage(
    name: '/',
    page: () => SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.homeScreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.loadingScreen,
    page: () => LoadingScreen(),
  ),
  GetPage(
    name: AppRoutes.ipAddressScreen,
    page: () => IpAddressScreen(),
  ),
  GetPage(
    name: AppRoutes.loginScreen,
    page: () => LoginScreen(),
  ),

  //************************agents Screens************************

  GetPage(
    name: AppRoutes.agentsAddScreen,
    page: () => const AgentsAddScreen(),
  ),
  GetPage(
    name: AppRoutes.agentsEditScreen,
    page: () => const AgentsEditScreen(),
  ),
  GetPage(
    name: AppRoutes.agentDetailsScreen,
    page: () => AgentDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.reportsArea,
    page: () => ReportsArea(),
  ),
  //************************campagin Screens************************

  GetPage(
    name: AppRoutes.campaginAddScreen,
    page: () => CampaginAddScreen(),
  ),
  GetPage(
    name: AppRoutes.campaginEditScreen,
    page: () => CampaginEditScreen(),
  ),
  GetPage(
    name: AppRoutes.campaginViewScreen,
    page: () => CampaginViewScreen(),
  ),
  GetPage(
    name: AppRoutes.campaginActiveViewScreen,
    page: () => const CampaginActiveViewScreen(),
  ),
  //************************statics Screens************************

  GetPage(
    name: AppRoutes.staticsAddScreen,
    page: () => StaticsAddScreen(),
  ),
  GetPage(
    name: AppRoutes.staticsViewScreen,
    page: () => StaticsViewScreen(),
  ),
  GetPage(
    name: AppRoutes.staticsEditScreen,
    page: () => StaticsEditScreen(),
  ),

  //************************reports Screens************************

  GetPage(
    name: AppRoutes.reportsAddScreen,
    page: () => ReportsAddScreen(),
  ),
  GetPage(
    name: AppRoutes.reportsEditScreen,
    page: () => ReportsEditScreen(),
  ),
  GetPage(
    name: AppRoutes.reportsViewScreen,
    page: () => ReportsViewScreen(),
  ),
  //************************alerts Screens************************

  GetPage(
    name: AppRoutes.alertsViewScreen,
    page: () => AlertsViewScreen(kind: '1'),
  ),
  GetPage(
    name: AppRoutes.alertsAddScreen,
    page: () => AlertsAddScreen(),
  ),
  //************************attend Screens************************

  GetPage(
    name: AppRoutes.attendViewScreen,
    page: () => const AttendViewScreen(),
  ),
  GetPage(
    name: AppRoutes.attendEmpScreen,
    page: () => const AttendEmpScreen(),
  ),
  //************************users Screens************************
  GetPage(
    name: AppRoutes.usersAddScreen,
    page: () => UsersAddScreen(),
  ),
  GetPage(
    name: AppRoutes.usersEditScreen,
    page: () => UsersEditScreen(),
  ),
  GetPage(
    name: AppRoutes.usersViewScreen,
    page: () => UsersViewScreen(),
  ),
  //************************safe Screens************************

  GetPage(
    name: AppRoutes.homeSafeScreen,
    page: () => HomeSafeScreen(),
  ),
  GetPage(
    name: AppRoutes.agentSafeDetailsScreen,
    page: () => AgentSafeDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.addOpreationScreen,
    page: () => AddOpreationScreen(),
  ),
  GetPage(
    name: AppRoutes.addPaymentScreen,
    page: () => AddPaymentScreen(),
  ),
  GetPage(
    name: AppRoutes.viewPaymentScreen,
    page: () => ViewPaymentScreen(),
  ),
  //************************Services Screens************************

  GetPage(
    name: AppRoutes.servicesAddScreen,
    page: () => ServicesAddScreen(),
  ),
  GetPage(
    name: AppRoutes.servicesEditScreen,
    page: () => ServicesEditScreen(),
  ),
  GetPage(
    name: AppRoutes.servicesViewScreen,
    page: () => ServicesViewScreen(),
  ),
];

class AppRoutes {
  static String mainRoot = '/';
  static String homeScreen = '/homeScreen';
  static String loginScreen = '/loginScreen';
  static String loadingScreen = '/loadingScreen';
  static String ipAddressScreen = '/ipAddressScreen';
  //agents
  static String agentsAddScreen = '/agentsAddScreen';
  static String agentsEditScreen = '/agentsEditScreen';
  static String agentDetailsScreen = '/agentDetailsScreen';
  static String reportsArea = '/reportsArea';
//campagins
  static String campaginAddScreen = '/campaginAddScreen';
  static String campaginEditScreen = '/campaginEditScreen';
  static String campaginViewScreen = '/campaginViewScreen';
  static String campaginActiveViewScreen = '/campaginActiveViewScreen';
  //statics
  static String staticsAddScreen = '/staticsAddScreen';
  static String staticsViewScreen = '/staticsViewScreen';
  static String staticsEditScreen = '/staticsEditScreen';
  //reports
  static String reportsAddScreen = '/reportsAddScreen';
  static String reportsEditScreen = '/reportsEditScreen';
  static String reportsViewScreen = '/reportsViewScreen';
  //alerts
  static String alertsViewScreen = '/alertsViewScreen';
  static String alertsAddScreen = '/alertsAddScreen';
  //attend
  static String attendViewScreen = '/attendViewScreen';
  static String attendEmpScreen = '/attendEmpScreen';
  //Users
  static String usersAddScreen = '/usersAddScreen';
  static String usersEditScreen = '/usersEditScreen';
  static String usersViewScreen = '/usersViewScreen';
  //safe
  static String homeSafeScreen = '/homeSafeScreen';
  static String agentSafeDetailsScreen = '/agentSafeDetailsScreen';
  static String addOpreationScreen = '/addOpreationScreen';
  static String addPaymentScreen = '/addPaymentScreen';
  static String viewPaymentScreen = '/viewPaymentScreen';
  //Users
  static String servicesAddScreen = '/servicesAddScreen';
  static String servicesEditScreen = '/servicesEditScreen';
  static String servicesViewScreen = '/servicesViewScreen';
}
