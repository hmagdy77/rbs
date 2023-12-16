import 'package:sidebarx/sidebarx.dart';

import '../../controllers/agents/agent_cart_controller.dart';
import '../../libraries.dart';
import 'agents/add_agents_screen.dart';
import 'alerts/view_alerts_screen.dart';
import 'attend/view_attend_screen.dart';
import 'campagins/view_active_campagin.dart';
import 'safe/home_safe_screen.dart';
import 'users/view_users_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  final AttendControllerImp attendController = Get.find<AttendControllerImp>();
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();
  final UsersControllerImp usersController = Get.find<UsersControllerImp>();
  final AgentCartControllerImp agentCartController =
      Get.find<AgentCartControllerImp>();
  final OpreationsControllerImp opreationsController =
      Get.find<OpreationsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          key: _key,
          appBar: AppBar(
            title: Text(usersController.userName),
            leading: const SizedBox(),
            backgroundColor: AppColorManger.canvasColor,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () async {
                  agentsController.getAgents();
                  agentCartController.pre(
                    agentsList: agentsController.activeAgents,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.report),
                onPressed: () {
                  if (agentCartController.myAgents.isEmpty) {
                    MySnackBar.snack('Prepare Reports', 'message');
                  } else {
                    Get.offAllNamed(AppRoutes.reportsArea);
                  }
                },
              ),
            ],
          ),
          // drawer: MyDrawer(controller: _controller),
          body: Row(
            children: [
              MyDrawer(controller: _controller),
              Expanded(
                child: Center(
                  child: Screens(
                    controller: _controller,
                    attendController: attendController,
                    agentsController: agentsController,
                    usersController: usersController,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    final UsersControllerImp usersController = Get.find<UsersControllerImp>();

    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        decoration: BoxDecoration(
          color: AppColorManger.canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: AppColorManger.scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColorManger.canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColorManger.actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [
              AppColorManger.accentCanvasColor,
              AppColorManger.canvasColor
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: AppSizes.w12,
        decoration: const BoxDecoration(
          color: AppColorManger.canvasColor,
        ),
      ),
      footerDivider:
          Divider(color: AppColorManger.white.withOpacity(0.3), height: 1),
      items: [
        const SidebarXItem(
          icon: Icons.home,
          label: AppStrings.agents,
        ),
        const SidebarXItem(icon: Icons.add, label: AppStrings.agentsAdd),
        const SidebarXItem(
            icon: FontAwesomeIcons.lightbulb, label: AppStrings.ideas),
        const SidebarXItem(icon: Icons.notifications, label: AppStrings.alerts),
        const SidebarXItem(icon: Icons.exit_to_app, label: AppStrings.logOut),
        usersController.userType == 1
            ? const SidebarXItem(
                icon: FontAwesomeIcons.dollarSign, label: AppStrings.safe)
            : const SidebarXItem(
                label: '',
                icon: Icons.lock,
              ),
        usersController.userType == 1
            ? const SidebarXItem(
                icon: Icons.campaign_sharp, label: AppStrings.camagins)
            : const SidebarXItem(
                label: '',
                icon: Icons.lock,
              ),
        usersController.userType == 1
            ? const SidebarXItem(
                icon: FontAwesomeIcons.peopleGroup, label: AppStrings.users)
            : const SidebarXItem(
                label: '',
                icon: Icons.lock,
              ),
        usersController.userType == 1
            ? const SidebarXItem(
                icon: FontAwesomeIcons.calendar,
                label: AppStrings.attendAndExit)
            : const SidebarXItem(
                label: '',
                icon: Icons.lock,
              ),
      ],
    );
  }
}

class Screens extends StatelessWidget {
  const Screens({
    Key? key,
    required this.controller,
    required this.attendController,
    required this.agentsController,
    required this.usersController,
  }) : super(key: key);

  final SidebarXController controller;
  final AttendControllerImp attendController;
  final AgentsControllerImp agentsController;
  final UsersControllerImp usersController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return ListView(
              shrinkWrap: true,
              children: [
                AlertsArea(),
                HomeBody(goTo: AppRoutes.agentDetailsScreen),
              ],
            );
          case 1:
            agentsController.clearTextFields();
            return const AgentsAddScreen();
          case 2:
            return AlertsViewScreen(kind: '2');
          case 3:
            return AlertsViewScreen(kind: '0');
          case 4:
            usersController.logOut();
            return const MyLottieLoading();
          case 5:
            if (usersController.userType == 1) {
              return HomeSafeScreen();
            } else {
              return const SizedBox();
            }
          case 6:
            if (usersController.userType == 1) {
              return const CampaginActiveViewScreen();
            } else {
              return const SizedBox();
            }
          case 7:
            if (usersController.userType == 1) {
              return UsersViewScreen();
            } else {
              return const SizedBox();
            }
          case 8:
            if (usersController.userType == 1) {
              attendController.viewAttend(date: DateTime.now());
              return const AttendViewScreen();
            } else {
              return const SizedBox();
            }

          default:
            return const SizedBox();
        }
      },
    );
  }
}
