import '../../libraries.dart';
part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInit());
  List<ServiceM> allServicess = [];
  // List<ServiceM> campaginServicess = [];
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  String selectedServiceName = '';
  String selectedServiceDesc = '';
  final List<DropdownMenuEntry<ServiceM>> servicesMenu =
      <DropdownMenuEntry<ServiceM>>[];

  getServicess() async {
    emit(ServicesLoading());
    try {
      var services = await ServicesRepo.viewServices();
      if (services.status == 'suc') {
        allServicess.clear();
        allServicess.addAll(services.data);
        preparaAgentsMenu();
        emit(ServicesSucsses());
      } else {
        emit(ServicesError());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
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
    emit(ServicesLoading());
    try {
      var addServicesRepo = await ServicesRepo.addServices(
        name: name.text,
        desc: desc.text,
      );
      if (addServicesRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        clearTextFields();
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(ServicesChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(ServicesFail());
      }
    } catch (e) {
      emit(ServicesError());
      showSnak(context: context, type: 0);
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
    emit(ServicesLoading());
    try {
      var editServicesRepo = await ServicesRepo.editServices(
        id: services.id,
        name: name.text,
        desc: desc.text,
      );
      if (editServicesRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(ServicesChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(ServicesFail());
      }
    } catch (e) {
      showSnak(context: context, type: 0);
      emit(ServicesError());
    }
  }

  deleteServices({required String id, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        emit(ServicesLoading());
        try {
          var deleteServicesRepo = await ServicesRepo.deleteServices(id: id);
          if (deleteServicesRepo.status == 'suc') {
            showSnak(context: context, type: 1);
            emit(ServicesChanged());
          } else {
            showSnak(context: context, type: 0);
            emit(ServicesFail());
          }
        } catch (e) {
          showSnak(context: context, type: 0);
          emit(ServicesError());
        }
      },
    );
  }
}
