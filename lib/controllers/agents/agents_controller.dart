import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../data/repo/repo_opreations.dart';
import '../../libraries.dart';

class AgentsController extends GetxController {}

class AgentsControllerImp extends AgentsController {
  List<Agent> allAgents = [];
  List<Agent> activeAgents = [];
  List<Agent> campaginAgent = [];
  List<Safe> safeList = [];
  var isLoading = false.obs;
  File? file;
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
  TextEditingController renewalValue = TextEditingController();
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

  @override
  void onInit() {
    getAgents();

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
    isLoading(false);
    update();
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
    isLoading(true);
    update();
    try {
      var addAgentRepo = await AgentsRepo.addAgent(
        file: file!,
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
        renewalValue: renewalValue.text.isEmpty ? '777' : renewalValue.text,
      );
      if (addAgentRepo.status == 'suc') {
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

  getAgents() async {
    isLoading(true);
    update();
    try {
      var agents = await Crud.postRequest(
        url: Api.agentsView,
        data: {},
        function: agentsModelFromJson,
      );
      await viewSafe();
      if (agents.status == 'suc') {
        allAgents.clear();
        allAgents.addAll(agents.data);
        sortAgents();
        await rewnable();
        isLoading(false);
        update();
      } else {
        isLoading(false);
        update();
      }
    } catch (_) {}
  }

  viewSafe() async {
    var safe = await AgentsRepo.viewSafe();
    if (safe.status == 'suc') {
      safeList.clear();
      safeList.addAll(safe.data);
      isLoading(false);
      update();
    } else {
      // showSnakString(context: context, label: AppStrings.thereAproplem);
    }
  }

  updateSafe({required String value}) async {
    await AgentsRepo.updateSafe(
      value: value,
    );
    isLoading(false);
    update();
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
    renewalValue.text = agent.renewalValue;
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
    renewalValue.clear();
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
    isLoading(true);
    update();
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
        renewalValue: renewalValue.text.isEmpty ? '777' : renewalValue.text,
      );
      if (editAgentRepo.status == 'suc') {
        await getAgents();
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
  }

  updateAgentAcc({required String id, required String account}) async {
    isLoading(true);
    update();
    try {
      var updateAgentAcc = await OperationsRepo.updateAgentAcc(
        account: account,
        id: id,
      );
      if (updateAgentAcc.status == 'suc') {
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

  deleteAgent(
      {required String id, required String image, required context}) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        isLoading(true);
        update();
        try {
          var deleteAgentRepo = await AgentsRepo.deleteAgent(
            id: id,
            image: image,
          );

          if (deleteAgentRepo.status == 'suc') {
            MySnackBar.snack(AppStrings.done, 'message');
            // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
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

  activeAgent({required String id, required String active}) async {
    isLoading(true);
    update();
    try {
      var actAgentRepo = await AgentsRepo.activeAgent(
        id: id,
        active: active,
      );
      if (actAgentRepo.status == 'suc') {
        MySnackBar.snack(AppStrings.done, 'message');
        await getAgents();
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

  rewnable() async {
    for (int index = 0; index < activeAgents.length; index++) {
      if (checkDate(agent: activeAgents[index])) {
        await addRewnalble(
            agent: activeAgents[index],
            desc: '${DateTime.now().year}-${DateTime.now().month}');
      }
    }
  }

  addRewnalble({
    required Agent agent,
    required String desc,
  }) async {
    try {
      var renable = await OperationsRepo.addRewnable(
        agent: agent.id,
        kind: '0',
        price: agent.renewalValue,
        serviceDesc: AppStrings.pageMange,
        serviceName: AppStrings.monthleRewnable,
        time: DateTime.now().toString(),
        desc: desc,
      );
      if (renable.status == 'suc') {
        await updateAgentAcc(
          id: agent.id,
          account: agent.renewalValue,
        );
      }
    } catch (_) {}
  }
}
