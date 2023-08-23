import 'package:flutter/material.dart';

import 'view/screens/agent_details_screen.dart';
import 'view/screens/agents/add_agents_screen.dart';
import 'view/screens/agents/edit_agents_screen.dart';
import 'view/screens/alerts/add_alerts_screen.dart';
import 'view/screens/alerts/view_alerts_screen.dart';
import 'view/screens/attend/view_emp_attend_screen.dart';
import 'view/screens/campagins/add_campagin_screen.dart';
import 'view/screens/campagins/edit_campagin_screen.dart';
import 'view/screens/campagins/view_active_campagin.dart';
import 'view/screens/campagins/view_campagin.dart';
import 'view/screens/home_screen.dart';
import 'view/screens/attend/view_attend_screen.dart';
import 'view/screens/reports/add_reports_screen.dart';
import 'view/screens/reports/edit_reports_screen.dart';
import 'view/screens/reports/view_reports.dart';
import 'view/screens/safe/add_opreation_screen.dart';
import 'view/screens/safe/add_payment_screen.dart';
import 'view/screens/safe/agent_safe_details_screen.dart';
import 'view/screens/safe/home_safe_screen.dart';
import 'view/screens/safe/view_payment_screen.dart';
import 'view/screens/services/add_service_screen.dart';
import 'view/screens/services/edit_services_screen.dart';
import 'view/screens/services/view_services.dart';
import 'view/screens/statics/add_statics_screen.dart';
import 'view/screens/statics/edit_statics_screen.dart';
import 'view/screens/statics/view_statics_screen.dart';
import 'view/screens/users/add_users_screen.dart';
import 'view/screens/users/edit_users_screen.dart';
import 'view/screens/users/login_screen.dart';
import 'view/screens/users/view_users_screen.dart';

Map<String, WidgetBuilder> routes = {
  AppRoutes.mainRoot: (context) => const HomeScreen(),
  AppRoutes.loginScreen: (context) => const LoginScreen(),
  //agents
  AppRoutes.agentsAddScreen: (context) => const AgentsAddScreen(),
  AppRoutes.agentsEditScreen: (context) => const AgentsEditScreen(),
  AppRoutes.agentDetailsScreen: (context) => const AgentDetailsScreen(),
  //campagins
  AppRoutes.campaginAddScreen: (context) => const CampaginAddScreen(),
  AppRoutes.campaginEditScreen: (context) => const CampaginEditScreen(),
  AppRoutes.campaginViewScreen: (context) => const CampaginViewScreen(),
  AppRoutes.campaginActiveViewScreen: (context) =>
      const CampaginActiveViewScreen(),
  //statics
  AppRoutes.staticsAddScreen: (context) => const StaticsAddScreen(),
  AppRoutes.staticsViewScreen: (context) => const StaticsViewScreen(),
  AppRoutes.staticsEditScreen: (context) => const StaticsEditScreen(),
  //reports
  AppRoutes.reportsAddScreen: (context) => const ReportsAddScreen(),
  AppRoutes.reportsEditScreen: (context) => const ReportsEditScreen(),
  AppRoutes.reportsViewScreen: (context) => const ReportsViewScreen(),
  //alerts
  AppRoutes.alertsViewScreen: (context) => const AlertsViewScreen(),
  AppRoutes.alertsAddScreen: (context) => const AlertsAddScreen(),
  //attend
  AppRoutes.attendViewScreen: (context) => const AttendViewScreen(),
  AppRoutes.attendEmpScreen: (context) => const AttendEmpScreen(),
  //users
  AppRoutes.usersAddScreen: (context) => const UsersAddScreen(),
  AppRoutes.usersEditScreen: (context) => const UsersEditScreen(),
  AppRoutes.usersViewScreen: (context) => const UsersViewScreen(),
  //safe
  AppRoutes.homeSafeScreen: (context) => const HomeSafeScreen(),
  AppRoutes.agentSafeDetailsScreen: (context) => const AgentSafeDetailsScreen(),
  AppRoutes.addOpreationScreen: (context) => const AddOpreationScreen(),
  AppRoutes.addPaymentScreen: (context) => const AddPaymentScreen(),
   AppRoutes.viewPaymentScreen: (context) => const ViewPaymentScreen(),
// Services
  AppRoutes.servicesAddScreen: (context) => const ServicesAddScreen(),
  AppRoutes.servicesEditScreen: (context) => const ServicesEditScreen(),
  AppRoutes.servicesViewScreen: (context) => const ServicesViewScreen(),
};

class AppRoutes {
  static const String mainRoot = '/';
  static const String loginScreen = '/loginScreen';
  //agents
  static const String agentsAddScreen = '/agentsAddScreen';
  static const String agentsEditScreen = '/agentsEditScreen';
  static const String agentDetailsScreen = '/agentDetailsScreen';
  //campagins
  static const String campaginAddScreen = '/campaginAddScreen';
  static const String campaginEditScreen = '/campaginEditScreen';
  static const String campaginViewScreen = '/campaginViewScreen';
  static const String campaginActiveViewScreen = '/campaginActiveViewScreen';
  //statics
  static const String staticsAddScreen = '/staticsAddScreen';
  static const String staticsViewScreen = '/staticsViewScreen';
  static const String staticsEditScreen = '/staticsEditScreen';
  //reports
  static const String reportsAddScreen = '/reportsAddScreen';
  static const String reportsEditScreen = '/reportsEditScreen';
  static const String reportsViewScreen = '/reportsViewScreen';
  //alerts
  static const String alertsViewScreen = '/alertsViewScreen';
  static const String alertsAddScreen = '/alertsAddScreen';
  //attend
  static const String attendViewScreen = '/attendViewScreen';
  static const String attendEmpScreen = '/attendEmpScreen';
  //Users
  static const String usersAddScreen = '/usersAddScreen';
  static const String usersEditScreen = '/usersEditScreen';
  static const String usersViewScreen = '/usersViewScreen';
  //safe
  static const String homeSafeScreen = '/homeSafeScreen';
  static const String agentSafeDetailsScreen = '/agentSafeDetailsScreen';
  static const String addOpreationScreen = '/addOpreationScreen';
  static const String addPaymentScreen = '/addPaymentScreen';
  static const String viewPaymentScreen = '/viewPaymentScreen';
  //Users
  static const String servicesAddScreen = '/servicesAddScreen';
  static const String servicesEditScreen = '/servicesEditScreen';
  static const String servicesViewScreen = '/servicesViewScreen';
}
