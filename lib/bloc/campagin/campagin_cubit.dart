import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../libraries.dart';
part 'campagin_state.dart';

class CampaginsCubit extends Cubit<CampaginState> {
  CampaginsCubit() : super(CampaginInit());
  List<Campagin> allCampagins = [];
  List<Campagin> agentCampagins = [];
  var formatter = DateFormat('yyyy-MM-dd');
  String startDate = '';
  String endDate = '';
  int active = 1;
  TextEditingController name = TextEditingController();
  TextEditingController link = TextEditingController();

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

  changeState() {
    emit(CampaginChanged());
  }

  addCampagin({required String agentName, required context}) async {
    emit(CampaginLoading());
    try {
      var addCampaginRepo = await CampaginsRepo.addCampagin(
        name: name.text,
        agentId: agentName,
        link: link.text,
        active: '1',
        startDate: startDate,
        endDate: endDate,
      );
      if (addCampaginRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(CampaginChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(CampaginFail());
      }
    } catch (e) {
      emit(CampaginError());
      showSnak(context: context, type: 0);
    }
  }

  getCampagins({required String id}) async {
    emit(CampaginLoading());
    try {
      var campagins = await CampaginsRepo.viewCampagin();
      if (campagins.status == 'suc') {
        allCampagins.clear();
        allCampagins.addAll(campagins.data);
        sortCampagins(id: int.parse(id));
        sortActiveCampagins();
        emit(CampaginSucsses());
      } else {
        emit(CampaginError());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  sortCampagins({required int id}) async {
    agentCampagins.clear();
    agentCampagins = allCampagins
        .where(
          (campagin) {
            int campagins = int.parse(campagin.agentId);
            return campagins == id;
          },
        )
        .toList()
        .reversed
        .toList();
  }

  sortActiveCampagins() async {
    agentCampagins.clear();
    agentCampagins = allCampagins
        .where(
          (campagin) {
            int campagins = int.parse(campagin.active);
            return campagins == 1;
          },
        )
        .toList()
        .reversed
        .toList();
  }

  prepareTextFields({required Campagin campagin}) {
    name.text = campagin.name;
    link.text = campagin.link;
    // startDate = campagin.startDate;
    // endDate = campagin.endDate;
  }

  clearTextFields() {
    name.clear();
    link.clear();
    startDate = '';
    endDate = '';
  }

  editCampagine({
    required context,
    required Campagin campagin,
  }) async {
    emit(CampaginLoading());
    try {
      var editCampaginRepo = await CampaginsRepo.editCampagin(
        id: campagin.id,
        name: name.text,
        agentId: campagin.agentId,
        link: link.text,
        startDate: campagin.startDate, // '00:00:00 $startDate',
        endDate: campagin.endDate, // '00:00:00 $endDate',
      );
      if (editCampaginRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(CampaginChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(CampaginFail());
      }
    } catch (e) {
      emit(CampaginError());
      showSnak(context: context, type: 0);
    }
  }

  deleteCampagin({required String id, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        emit(CampaginLoading());
        try {
          var deleteCampaginRepo = await CampaginsRepo.deleteCampagin(
            id: id,
          );
          if (deleteCampaginRepo.status == 'suc') {
            showSnak(context: context, type: 1);
            // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
            emit(CampaginChanged());
          } else {
            showSnak(context: context, type: 0);
            emit(CampaginFail());
          }
        } catch (e) {
          emit(CampaginError());
          showSnak(context: context, type: 0);
        }
      },
    );
  }

  activeCampagin(
      {required String id, required String active, required context}) async {
    {
      try {
        var actAgentRepo = await CampaginsRepo.activeCampagin(
          id: id,
          active: active,
        );
        if (actAgentRepo.status == 'suc') {
          showSnak(context: context, type: 1);
          // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
          emit(CampaginChanged());
        } else {
          showSnak(context: context, type: 0);
          emit(CampaginFail());
        }
      } catch (e) {
        showSnak(context: context, type: 0);
        emit(CampaginError());
      }
    }
  }
}
