import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:rbs/data/repo/repo_opreations.dart';

import '../../libraries.dart';
part 'opreations_state.dart';

class OpreationsCubit extends Cubit<OpreationsState> {
  OpreationsCubit() : super(OpreationsInit());
  List<Opreation> allOpreations = [];
  List<Opreation> agentOpreations = [];
  List<Opreation> paymentOpreations = [];

  var formatter = DateFormat('yyyy-MM-dd');
  DateTime opreationTime = DateTime.now();
  // bool kind = false;
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

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

  changeDate({required DateTime date}) {
    opreationTime = date;
    emit(OpreationsChanged());
  }

  changeState() {
    emit(OpreationsChanged());
  }

  addOpreation({
    required Agent agent,
    required String serviceName,
    required String serviceDesc,
    required String kind,
    required context,
  }) async {
    emit(OpreationsLoading());
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
        if (kind == '0') {
          agent.account += ' + (${price.text})';
        } else if (kind == '1') {
          agent.account += ' - (${price.text})';
          await AgentsRepo.updateSafe(
            value: price.text,
          );
          showSnak(context: context, type: 1);
        } else {
          await AgentsRepo.updateSafe(
            value: '-${price.text}',
          );
        }
        emit(OpreationsChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(OpreationsFail());
      }
    } catch (e) {
      emit(OpreationsError());
      showSnak(context: context, type: 0);
    }
  }

  addPayment({
    required String serviceName,
    required String serviceDesc,
    required context,
  }) async {
    emit(OpreationsLoading());
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
        showSnak(context: context, type: 1);
        emit(OpreationsChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(OpreationsFail());
      }
    } catch (e) {
      emit(OpreationsError());
      showSnak(context: context, type: 0);
    }
  }

  updateSafe({required String value}) async {
    await AgentsRepo.updateSafe(
      value: value,
    );
  }

  getOpreations({required String id}) async {
    emit(OpreationsLoading());
    try {
      var opreations = await OperationsRepo.viewOpreations();
      if (opreations.status == 'suc') {
        allOpreations.clear();
        allOpreations.addAll(opreations.data);
        sortOpreations(id: id);
        emit(OpreationsSucsses());
      } else {
        emit(OpreationsError());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
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

  deleteOpreation({required String id, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        emit(OpreationsLoading());
        try {
          var deleteOpreation = await OperationsRepo.deleteOpreations(id: id);
          if (deleteOpreation.status == 'suc') {
            showSnak(context: context, type: 1);
            emit(OpreationsChanged());
          } else {
            showSnak(context: context, type: 0);
            emit(OpreationsFail());
          }
        } catch (e) {
          emit(OpreationsError());
          showSnak(context: context, type: 0);
        }
      },
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
  //       showSnak(context: context, type: 1);
  //       // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
  //       emit(SafeChanged());
  //     } else {
  //       showSnak(context: context, type: 0);
  //       emit(SafeFail());
  //     }
  //   } catch (e) {
  //     emit(SafeError());
  //     showSnak(context: context, type: 0);
  //   }
  // }
}
