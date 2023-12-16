import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../data/repo/repo_opreations.dart';
import '../../libraries.dart';
import '../../view/widgets/public/dialouge.dart';

class OpreationsController extends GetxController {}

class OpreationsControllerImp extends OpreationsController {
  List<Opreation> allOpreations = [];
  List<Opreation> agentOpreations = [];
  List<Opreation> paymentOpreations = [];
  List<Opreation> rangedOpreations = [];
  List<List<String>> printItems = [];
  var isLoading = false.obs;
  var formatter = DateFormat('yyyy-MM-dd');
  DateTime opreationTime = DateTime.now();
  var startDateView = DateTime.now().obs;
  var endDateView = DateTime.now().obs;
  var startDate = ''.obs;
  var endDate = ''.obs;
  var endDateSend = ''.obs;
  var dateFormatter = DateFormat('yyyy-MM-dd');
  // bool kind = false;
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  void onInit() {
    getOpreations();
    super.onInit();
  }

  void showDialog({required Widget child, context}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: AppSizes.h6,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  getOpreationsfromRange({
    required int agentId,
  }) async {
    isLoading(true);
    update();
    try {
      var reports = await OperationsRepo.operationsDate(
        agentId: agentId.toString(),
        start: startDate.value,
        end: endDate.value,
      );
      if (reports.status == 'suc') {
        rangedOpreations.clear();
        rangedOpreations.addAll(reports.data);
        isLoading(false);
        update();
      } else {
        isLoading(false);
        update();
      }
    } catch (e) {
      isLoading(false);
      update();
    }
  }

  changeDate({required DateTime date}) {
    isLoading(true);
    update();
    opreationTime = date;
    isLoading(false);
    update();
  }

  changeDateForRange({required DateTime date, required String kind}) {
    if (kind == '1') {
      startDate.value = dateFormatter.format(date);
      startDateView.value = date;
    } else {
      endDateView.value = date;
      endDate.value = dateFormatter.format(date);
      endDateSend.value =
          '${date.year}-${date.month}-${date.day} 11:59:59'; //dateFormatter.format(date);
    }
    isLoading(false);
    update();
  }

  addOpreation({
    required Agent agent,
    required String serviceName,
    required String serviceDesc,
    required String kind,
    required context,
  }) async {
    isLoading(true);
    update();
    try {
      var addSafeRepo = await OperationsRepo.addOpreations(
        agent: agent.id,
        kind: kind,
        price: price.text,
        serviceDesc: serviceDesc,
        serviceName: serviceName,
        time: opreationTime.toString(),
        desc: '',
      );
      if (addSafeRepo.status == 'suc') {
        getOpreations();
        if (kind == '0') {
          agent.account += ' + (${price.text})';
        } else if (kind == '1') {
          agent.account += ' - (${price.text})';
          await AgentsRepo.updateSafe(
            value: price.text,
          );
          MySnackBar.snack(AppStrings.done, 'message');
        } else {
          await AgentsRepo.updateSafe(
            value: '-${price.text}',
          );
        }
        // Get.offAllNamed(AppRoutes.loadingScreen, arguments: [
        //   AppRoutes.agentSafeDetailsScreen,
        //   [agent],
        //   getOpreations,
        // ]);
        MySnackBar.snack(AppStrings.done, 'message');
        Get.back();
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

  addPayment({
    required String serviceName,
    required String serviceDesc,
    required context,
  }) async {
    isLoading(true);
    update();
    try {
      var addSafeRepo = await OperationsRepo.addOpreations(
        agent: '0',
        kind: '2',
        price: price.text,
        serviceDesc: serviceDesc,
        serviceName: serviceName,
        time: opreationTime.toString(),
        desc: '',
      );
      if (addSafeRepo.status == 'suc') {
        updateSafe(value: '-${price.text}');
        Get.offAllNamed(
          AppRoutes.loadingScreen,
          arguments: [
            AppRoutes.viewPaymentScreen,
            getOpreations(),
          ],
        );
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

  updateSafe({required String value}) async {
    await AgentsRepo.updateSafe(
      value: value,
    );
  }

  getOpreations() async {
    isLoading(true);
    update();
    try {
      var opreations = await OperationsRepo.viewOpreations();
      if (opreations.status == 'suc') {
        allOpreations.clear();
        allOpreations.addAll(opreations.data);
        sortOpreations(id: '0');
        isLoading(false);
        update();
      } else {
        isLoading(false);
        update();
      }
    } catch (e) {
      isLoading(false);
      update();
    }
  }

  sortOpreations({required String id}) async {
    agentOpreations.clear();
    paymentOpreations.clear();
    agentOpreations = allOpreations
        .where(
          (opreation) {
            int opreationAgentId = int.parse(opreation.agent);
            int agentId = int.parse(id);
            return agentId == opreationAgentId;
          },
        )
        .toList()
        .reversed
        .toList();
    paymentOpreations = allOpreations
        .where(
          (opreation) {
            int opreationKind = int.parse(opreation.kind);
            return opreationKind == 2;
          },
        )
        .toList()
        .reversed
        .toList();
  }

  deleteOpreation({required String id}) async {
    myDialuge(
      confirm: () async {
        isLoading(true);
        update();
        try {
          var deleteOpreation = await OperationsRepo.deleteOpreations(id: id);
          if (deleteOpreation.status == 'suc') {
            MySnackBar.snack(AppStrings.done, 'message');
            getOpreations();
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
      },
      title: AppStrings.delete,
    );
  }

  clearTextFields() {
    name.clear();
    description.clear();
    price.clear();
    opreationTime = DateTime.now();
  }
  // sortActiveSafes() async {
  //   agentSafes.clear();
  //   agentSafes = allSafes
  //       .where(
  //         (Safe) {
  //           int Safes = int.parse(Safe.active);
  //           return Safes == 1;
  //         },
  //       )
  //       .toList()
  //       .reversed
  //       .toList();
  // }

  // prepareTextFields({required Safe Safe}) {
  //   name.text = Safe.name;
  //   link.text = Safe.link;
  //   // startDate = Safe.startDate;
  //   // endDate = Safe.endDate;
  // }

  // editSafee({
  //   required context,
  //   required Opreation opreation,
  // }) async {
  //   emit(SafeLoading());
  //   try {
  //     var editSafeRepo = await SafesRepo.editSafe(
  //       id: Safe.id,
  //       name: name.text,
  //       agentId: Safe.agentId,
  //       link: link.text,
  //       startDate: Safe.startDate, // '00:00:00 $startDate',
  //       endDate: Safe.endDate, // '00:00:00 $endDate',
  //     );
  //     if (editSafeRepo.status == 'suc') {
  //      MySnackBar.snack(AppStrings.done, 'message');
  //       // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
  //       emit(SafeChanged());
  //     } else {
  //       MySnackBar.snack(AppStrings.faild, 'message');
  //       emit(SafeFail());
  //     }
  //   } catch (e) {
  //     emit(SafeError());
  //     MySnackBar.snack(AppStrings.faild, 'message');
  //   }
  // }
}
