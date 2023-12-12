class Api {
  //***************************Api***************************
  static const String baseUrl = 'http://www.rightbs.com/system/rbs';
  //***************************agents***************************
  static const String agentsView = '$baseUrl/agents/view.php';
  static const String agentsAdd = '$baseUrl/agents/add.php';
  static const String agentsEdit = '$baseUrl/agents/edit.php';
  static const String agentsDelete = '$baseUrl/agents/delete.php';
  static const String agentsActive = '$baseUrl/agents/act.php';
  static const String agentsViewImage = '$baseUrl/agents/saved';
  //***************************reports***************************
  static const String reportsView = '$baseUrl/reports/view.php';
  static const String reportsAdd = '$baseUrl/reports/add.php';
  static const String reportsEdit = '$baseUrl/reports/edit.php';
  static const String reportsDelete = '$baseUrl/reports/delete.php';
  static const String reportsDate = '$baseUrl/reports/date.php';
  //***************************campagins**************************
  static const String campaginsView = '$baseUrl/campagins/view.php';
  static const String campaginsAdd = '$baseUrl/campagins/add.php';
  static const String campaginsEdit = '$baseUrl/campagins/edit.php';
  static const String campaginsDelete = '$baseUrl/campagins/delete.php';
  static const String campaginsActive = '$baseUrl/campagins/act.php';
  //***************************statistics***************************
  static const String statisticsView = '$baseUrl/statistics/view.php';
  static const String statisticsAdd = '$baseUrl/statistics/add.php';
  static const String statisticsEdit = '$baseUrl/statistics/edit.php';
  static const String statisticsDelete = '$baseUrl/statistics/delete.php';
  //sum
  static const String statisticsCommentsSum =
      '$baseUrl/statistics/sum/comments.php';
  static const String statisticsMessagesSum =
      '$baseUrl/statistics/sum/messages.php';
  static const String statisticsLikesSum = '$baseUrl/statistics/sum/likes.php';
  static const String statisticsReachSum = '$baseUrl/statistics/sum/reach.php';
//***************************alerts**************************
  static const String alertsView = '$baseUrl/alerts/view.php';
  static const String alertsAdd = '$baseUrl/alerts/add.php';
  static const String alertsEdit = '$baseUrl/alerts/edit.php';
  static const String alertsDelete = '$baseUrl/alerts/delete.php';
  static const String alertsSeen = '$baseUrl/alerts/seen.php';
//***************************users**************************
  static const String usersView = '$baseUrl/users/view.php';
  static const String usersAdd = '$baseUrl/users/add.php';
  static const String usersEdit = '$baseUrl/users/edit.php';
  static const String usersDelete = '$baseUrl/users/delete.php';
  static const String usersLogin = '$baseUrl/users/login.php';
//***************************attend**************************
  static const String attendExit = '$baseUrl/attend/exit.php';
  static const String attendAttend = '$baseUrl/attend/attend.php';
  static const String attendLog = '$baseUrl/attend/log.php';
  static const String attendToday = '$baseUrl/attend/today.php';
//***************************opreations**************************
  static const String operationsAdd = '$baseUrl/opreations/add.php';
  static const String operationsRewnable = '$baseUrl/opreations/rewnable.php';
  static const String operationsEdit = '$baseUrl/opreations/edit.php';
  static const String operationsView = '$baseUrl/opreations/view.php';
  static const String operationsDelete = '$baseUrl/opreations/delete.php';
  static const String updateAgentAcc = '$baseUrl/opreations/update_agent.php';
  static const String updateSafe = '$baseUrl/opreations/update_safe.php';
  static const String viewSafe = '$baseUrl/opreations/view_safe.php';
  static const String operationsDate = '$baseUrl/opreations/date.php';
//***************************services**************************
  static const String servicesAdd = '$baseUrl/services/add.php';
  static const String servicesEdit = '$baseUrl/services/edit.php';
  static const String servicesView = '$baseUrl/services/view.php';
  static const String servicesDelete = '$baseUrl/services/delete.php';
}
