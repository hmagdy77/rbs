import 'controllers/agents/agent_cart_controller.dart';
import 'controllers/notifications/notifications_controller.dart';
import 'libraries.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(IpAddressControllerImp());
    Get.put(AgentsControllerImp());
    Get.put(AgentCartControllerImp());
    Get.put(NotificationsController());
    Get.put(CampaginsControllerImp());
    Get.put(StaticsControllerImp());
    Get.put(ReportsControllerImp());
    Get.put(AlertsControllerImp());
    Get.put(UsersControllerImp());
    Get.put(AttendControllerImp());
    Get.put(OpreationsControllerImp());
    Get.put(ServicesControllerImp());
  }
}
