// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../data/repo/repo_opreations.dart';
import '../../libraries.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  AgentsCubit() : super(AgentsInit());
  List<Agent> allAgents = [];
  List<Agent> activeAgents = [];
  List<Agent> campaginAgent = [];
  List<Safe> safeList = [];
  List<int>? selectedFile;
  Uint8List? bytesData;
  String? imageName;
  var formatter = DateFormat('dd-MM-yyyy');
  var dateFormatter = DateFormat('yyyy-MM-dd');
  String renewalDate = '';
  String selectedAgent = '';
  int active = 1;
  int agentAccSum = 0;
  final List<DropdownMenuEntry<Agent>> agentsMenu =
      <DropdownMenuEntry<Agent>>[];
  TextEditingController name = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController phone2 = TextEditingController();
  TextEditingController fbPosts = TextEditingController();
  TextEditingController fbRells = TextEditingController();
  TextEditingController fbStorys = TextEditingController();
  TextEditingController fbVideos = TextEditingController();
  TextEditingController insPosts = TextEditingController();
  TextEditingController insRells = TextEditingController();
  TextEditingController insStorys = TextEditingController();
  TextEditingController insVideos = TextEditingController();
  TextEditingController insHighlight = TextEditingController();
  TextEditingController wbBlog = TextEditingController();
  TextEditingController wbphotos = TextEditingController();
  TextEditingController wbVideos = TextEditingController();
  TextEditingController ytShorts = TextEditingController();
  TextEditingController ytVideos = TextEditingController();
  TextEditingController dsFrame = TextEditingController();
  TextEditingController dsCover = TextEditingController();
  TextEditingController dsPosts = TextEditingController();

  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        bytesData = const Base64Decoder()
            .convert(reader.result.toString().split(",").last);
        selectedFile = bytesData;
      });
      reader.readAsDataUrl(file);
      imageName = file.name.toString();
    });
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
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  changeDate({required DateTime date}) {
    renewalDate = dateFormatter.format(date);
    emit(AgentsChanged());
  }

  bool checkDate({required Agent agent}) {
    if (agent.renewalDate.day == DateTime.now().day ||
        agent.renewalDate.day == DateTime.now().day + 1 ||
        agent.renewalDate.day == DateTime.now().day + 2 ||
        agent.renewalDate.day == DateTime.now().day + 3) {
      return true;
    } else {
      return false;
    }
  }

  addAgent({required context}) async {
    emit(AgentsLoading());
    try {
      var addAgentRepo = await AgentsRepo.addAgent(
        selectedFile: selectedFile,
        imageName: imageName!,
        active: active.toString(),
        name: name.text.isEmpty ? 'name' : name.text,
        phone1: phone1.text.isEmpty ? '0100' : phone1.text,
        phone2: phone2.text.isEmpty ? '0100' : phone2.text,
        renewalDate: renewalDate,
        // Facebook
        fbPosts: fbPosts.text.isEmpty ? '0' : fbPosts.text,
        fbRells: fbRells.text.isEmpty ? '0' : fbRells.text,
        fbStorys: fbStorys.text.isEmpty ? '0' : fbStorys.text,
        fbVideos: fbVideos.text.isEmpty ? '0' : fbVideos.text,
        //instgram
        insPosts: insPosts.text.isEmpty ? '0' : insPosts.text,
        insRells: insRells.text.isEmpty ? '0' : insRells.text,
        insStorys: insStorys.text.isEmpty ? '0' : insStorys.text,
        insVideos: insVideos.text.isEmpty ? '0' : insVideos.text,
        insHighlight: insHighlight.text.isEmpty ? '0' : insHighlight.text,
        // Website
        wbBlog: wbBlog.text,
        wbphotos: wbphotos.text.isEmpty ? '0' : wbphotos.text,
        wbVideos: wbVideos.text.isEmpty ? '0' : wbVideos.text,
        //Youtube
        ytShorts: ytShorts.text.isEmpty ? '0' : ytShorts.text,
        ytVideos: ytVideos.text.isEmpty ? '0' : ytVideos.text,
        //Design
        dsFrame: dsFrame.text.isEmpty ? '0' : dsFrame.text,
        dsCover: dsCover.text.isEmpty ? '0' : dsCover.text,
        dsPosts: dsPosts.text.isEmpty ? '0' : dsPosts.text,
      );
      if (addAgentRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(AgentsChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(AgentsFail());
      }
    } catch (e) {
      showSnak(context: context, type: 0);
      emit(AgentsError());
    }
  }

  getAgents({required context}) async {
    emit(AgentsLoading());
    try {
      var agents = await Crud.postRequest(
        url: Api.agentsView,
        data: {},
        function: agentsModelFromJson,
      );
      await viewSafe(context: context);
      if (agents.status == 'suc') {
        allAgents.clear();
        allAgents.addAll(agents.data);
        sortAgents();
        emit(AgentsSucsses());
      } else {
        emit(AgentsError());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  viewSafe({required context}) async {
    var safe = await AgentsRepo.viewSafe();
    if (safe.status == 'suc') {
      safeList.clear();
      safeList.addAll(safe.data);
      emit(AgentsChanged());
    } else {
      showSnakString(context: context, label: AppStrings.thereAproplem);
    }
  }

  updateSafe({required String value}) async {
    await AgentsRepo.updateSafe(
      value: value,
    );
    emit(AgentsChanged());
  }

  sortAgents() async {
    activeAgents.clear();
    activeAgents = allAgents
        .where(
          (agent) {
            int active = int.parse(agent.active);
            return active == 1;
          },
        )
        .toList()
        .reversed
        .toList();
    preparaAgentsMenu();
    calcAgentAcc();
  }

  calcAgentAcc() {
    agentAccSum = 0;
    for (int i = 0; i < activeAgents.length; i++) {
      agentAccSum += int.parse(activeAgents[i].account);
    }
  }

  getAgentsByCampagin({required int campaginAgentId}) async {
    campaginAgent.clear();
    campaginAgent = allAgents.where(
      (agent) {
        int agentId = int.parse(agent.id);
        return agentId == campaginAgentId;
      },
    ).toList();
  }

  preparaAgentsMenu() {
    agentsMenu.clear();
    for (int i = 0; i < activeAgents.length; i++) {
      agentsMenu.add(
        DropdownMenuEntry<Agent>(
          value: activeAgents[i],
          label: activeAgents[i].name,
        ),
      );
    }
  }

  prepareTextFields({required Agent agent}) {
    renewalDate = dateFormatter.format(agent.renewalDate);
    name.text = agent.name;
    phone1.text = agent.phone1;
    phone2.text = agent.phone2;
    fbPosts.text = agent.fbPosts;
    fbRells.text = agent.fbRells;
    fbStorys.text = agent.fbStorys;
    fbVideos.text = agent.fbVideos;
    insPosts.text = agent.insPosts;
    insRells.text = agent.insRells;
    insStorys.text = agent.insStorys;
    insVideos.text = agent.insVideos;
    insHighlight.text = agent.insHighlight;
    ytVideos.text = agent.ytVideos;
    ytShorts.text = agent.ytShorts;
    wbBlog.text = agent.wbBlog;
    wbVideos.text = agent.wbVideos;
    wbphotos.text = agent.wbPhotos;
    dsCover.text = agent.dsCover;
    dsFrame.text = agent.dsFrame;
    dsPosts.text = agent.dsPosts;
  }

  clearTextFields() {
    renewalDate = '';
    name.clear();
    phone1.clear();
    phone2.clear();
    fbPosts.clear();
    fbRells.clear();
    fbStorys.clear();
    fbVideos.clear();
    insPosts.clear();
    insRells.clear();
    insStorys.clear();
    insVideos.clear();
    insHighlight.clear();
    ytVideos.clear();
    ytShorts.clear();
    wbBlog.clear();
    wbVideos.clear();
    wbphotos.clear();
    dsCover.clear();
    dsFrame.clear();
    dsPosts.clear();
  }

  editAgent(
      {required String id, required String active, required context}) async {
    emit(AgentsLoading());
    try {
      var editAgentRepo = await AgentsRepo.editAgent(
        id: id,
        active: active,
        name: name.text.isEmpty ? 'name' : name.text,
        phone1: phone1.text.isEmpty ? '0100' : phone1.text,
        phone2: phone2.text.isEmpty ? '0100' : phone2.text,
        renewalDate: renewalDate,
        // Facebook
        fbPosts: fbPosts.text.isEmpty ? '0' : fbPosts.text,
        fbRells: fbRells.text.isEmpty ? '0' : fbRells.text,
        fbStorys: fbStorys.text.isEmpty ? '0' : fbStorys.text,
        fbVideos: fbVideos.text.isEmpty ? '0' : fbVideos.text,
        //instgram
        insPosts: insPosts.text.isEmpty ? '0' : insPosts.text,
        insRells: insRells.text.isEmpty ? '0' : insRells.text,
        insStorys: insStorys.text.isEmpty ? '0' : insStorys.text,
        insVideos: insVideos.text.isEmpty ? '0' : insVideos.text,
        insHighlight: insHighlight.text.isEmpty ? '0' : insHighlight.text,
        // Website
        wbBlog: wbBlog.text,
        wbphotos: wbphotos.text.isEmpty ? '0' : wbphotos.text,
        wbVideos: wbVideos.text.isEmpty ? '0' : wbVideos.text,
        //Youtube
        ytShorts: ytShorts.text.isEmpty ? '0' : ytShorts.text,
        ytVideos: ytVideos.text.isEmpty ? '0' : ytVideos.text,
        //Design
        dsFrame: dsFrame.text.isEmpty ? '0' : dsFrame.text,
        dsCover: dsCover.text.isEmpty ? '0' : dsCover.text,
        dsPosts: dsPosts.text.isEmpty ? '0' : dsPosts.text,
      );
      if (editAgentRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(AgentsChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(AgentsFail());
      }
    } catch (e) {
      showSnak(context: context, type: 0);
      emit(AgentsError());
    }
  }

  updateAgentAcc(
      {required String id, required String account, required context}) async {
    emit(AgentsLoading());
    try {
      var updateAgentAcc = await OperationsRepo.updateAgentAcc(
        account: account,
        id: id,
      );
      if (updateAgentAcc.status == 'suc') {
        showSnak(context: context, type: 1);
        emit(AgentsChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(AgentsFail());
      }
    } catch (e) {
      showSnak(context: context, type: 0);
      emit(AgentsError());
    }
  }

  deleteAgent(
      {required String id, required String image, required context}) async {
    showSnakConfirm(
        context: context,
        onTap: () async {
          emit(AgentsLoading());
          try {
            var deleteAgentRepo = await AgentsRepo.deleteAgent(
              id: id,
              image: image,
            );

            if (deleteAgentRepo.status == 'suc') {
              showSnak(context: context, type: 1);
              // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
              emit(AgentsChanged());
            } else {
              showSnak(context: context, type: 0);
              emit(AgentsFail());
            }
          } catch (e) {
            showSnak(context: context, type: 0);
            emit(AgentsError());
          }
        });
  }

  activeAgent(
      {required String id, required String active, required context}) async {
    {
      try {
        var actAgentRepo = await AgentsRepo.activeAgent(
          id: id,
          active: active,
        );
        if (actAgentRepo.status == 'suc') {
          showSnak(context: context, type: 1);
          // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
          emit(AgentsChanged());
        } else {
          showSnak(context: context, type: 0);
          emit(AgentsFail());
        }
      } catch (e) {
        showSnak(context: context, type: 0);
        emit(AgentsError());
      }
    }
  }
}
