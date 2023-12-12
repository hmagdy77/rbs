import '../../libraries.dart';

class ServicesController extends GetxController {}

class ServicesControllerImp extends ServicesController {
  List<ServiceM> allServicess = [];
  // List<ServiceM> campaginServicess = [];
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  String selectedServiceName = '';
  String selectedServiceDesc = '';
  final List<DropdownMenuEntry<ServiceM>> servicesMenu =
      <DropdownMenuEntry<ServiceM>>[];
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getServicess();
  }

  getServicess() async {
    isLoading(true);
    update();
    try {
      var services = await ServicesRepo.viewServices();
      if (services.status == 'suc') {
        allServicess.clear();
        allServicess.addAll(services.data);
        preparaAgentsMenu();
        isLoading(false);
        update();
      } else {
        isLoading(false);
        update();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      isLoading(false);
      update();
    }
  }

  preparaAgentsMenu() {
    servicesMenu.clear();
    for (int i = 0; i < allServicess.length; i++) {
      servicesMenu.add(
        DropdownMenuEntry<ServiceM>(
          value: allServicess[i],
          label: allServicess[i].name,
        ),
      );
    }
  }

  addServices({
    required context,
  }) async {
    isLoading(true);
    update();
    try {
      var addServicesRepo = await ServicesRepo.addServices(
        name: name.text,
        desc: desc.text,
      );
      if (addServicesRepo.status == 'suc') {
        MySnackBar.snack(AppStrings.done, 'message');
        clearTextFields();
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        isLoading(false);
        update();
      } else {
        MySnackBar.snack(AppStrings.faild, 'message');
        isLoading(false);
        update();
      }
    } catch (e) {
      isLoading(false);
      update();
      MySnackBar.snack(AppStrings.faild, 'message');
    }
  }

  prepareTextFields({required ServiceM services}) {
    name.text = services.name;
    desc.text = services.desc;
  }

  clearTextFields() {
    name.clear();
    desc.clear();
  }

  editServicese({required ServiceM services, required context}) async {
    isLoading(true);
    update();
    try {
      var editServicesRepo = await ServicesRepo.editServices(
        id: services.id,
        name: name.text,
        desc: desc.text,
      );
      if (editServicesRepo.status == 'suc') {
        MySnackBar.snack(AppStrings.done, 'message');
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        isLoading(false);
        update();
      } else {
        MySnackBar.snack(AppStrings.faild, 'message');
        isLoading(false);
        update();
      }
    } catch (e) {
      MySnackBar.snack(AppStrings.faild, 'message');
      isLoading(false);
      update();
    }
  }

  deleteServices({required String id, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        isLoading(true);
        update();
        try {
          var deleteServicesRepo = await ServicesRepo.deleteServices(id: id);
          if (deleteServicesRepo.status == 'suc') {
            MySnackBar.snack(AppStrings.done, 'message');
            isLoading(false);
            update();
          } else {
            MySnackBar.snack(AppStrings.faild, 'message');
            isLoading(false);
            update();
          }
        } catch (e) {
          MySnackBar.snack(AppStrings.faild, 'message');
          isLoading(false);
          update();
        }
      },
    );
  }
}
