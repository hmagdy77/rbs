import '../../libraries.dart';

abstract class AgentCartController extends GetxController {}

class AgentCartControllerImp extends AgentCartController {
  Map<Agent, List<List<RxBool>>> myAgents = <Agent, List<List<RxBool>>>{}.obs;

  var isLoading = false.obs;
  var allReports = 0.obs;
  var allDoneReports = 0.obs;
  @override
  void onInit() {
    myAgents.clear();

    super.onInit();
  }

  upd() {
    isLoading(true);
    update();
    isLoading(false);
    update();
  }

  addToCarts({required List<Agent> agents}) {
    for (int index = 0; index < agents.length; index++) {
      if (!myAgents.containsKey(agents[index])) {
        myAgents[agents[index]] = [
          [], //0  fbPosts
          [], //1  fbRells
          [], //2  fbStorys
          [], //3  fbVideos
          [], //4  insPosts
          [], //5  insRells
          [], //6  insStorys
          [], //7  insHighlight
          [], //8  insVideos
          [], //9  wbVideos
          [], //10 wbPhotos
          [], //11 wbBlog
          [], //12 ytVideos
          [], //13 ytShorts
          [], //14 dsCover
          [], //15 dsFrame
          [], //16 dsPosts
        ];
      }
    }
  }

  pre({required List<Agent> agentsList}) {
    myAgents.clear();
    allReports.value = 0;
    allDoneReports.value = 0;
    addToCarts(agents: agentsList);
    List agents = myAgents.keys.toList();
    for (int index = 0; index < myAgents.length; index++) {
      updateAgent(agent: agents[index], index: index);
    }
  }

  updateAgent({required Agent agent, required int index}) {
    List values = myAgents.values.toList();
    //**************************Instgram*******************************/
    //**************************fbPosts*******************************
    if ((int.parse(agent.fbPosts) ~/ 26) < 1 && agent.fbPosts != '0') {
      values[index][0].add(false.obs);
      int x = int.parse(agent.reports);
      agent.reports = (x + 1).toString();
      allReports++;
    } else {
      for (int i = 1; i <= (int.parse(agent.fbPosts) ~/ 26); i++) {
        values[index][0].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    }
    //**************************fbRells*******************************
    if ((int.parse(agent.fbRells) ~/ 26) < 1 && agent.fbRells != '0') {
      values[index][1].add(false.obs);
      int x = int.parse(agent.reports);
      agent.reports = (x + 1).toString();
      allReports++;
    } else {
      for (int i = 1; i <= (int.parse(agent.fbRells) ~/ 26); i++) {
        values[index][1].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    }
    //**************************fbStorys*******************************
    if ((int.parse(agent.fbStorys) ~/ 26) < 1 && agent.fbStorys != '0') {
      values[index][2].add(false.obs);
      int x = int.parse(agent.reports);
      agent.reports = (x + 1).toString();
      allReports++;
    } else {
      for (int i = 1; i <= (int.parse(agent.fbStorys) ~/ 26); i++) {
        values[index][2].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    }
    //**************************fbVideos*******************************
    if ((int.parse(agent.fbVideos) ~/ 26) < 1 && agent.fbVideos != '0') {
      values[index][3].add(false.obs);
      int x = int.parse(agent.reports);
      agent.reports = (x + 1).toString();
      allReports++;
    } else {
      for (int i = 1; i <= (int.parse(agent.fbVideos) ~/ 26); i++) {
        values[index][3].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    }
    //**************************Instgram*******************************/
    //**************************insPosts*******************************
    if ((int.parse(agent.insPosts) ~/ 26) < 1 && agent.insPosts != '0') {
      for (int i = 1; i <= (int.parse(agent.insPosts) ~/ 26); i++) {
        values[index][4].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    } else {
      for (int i = 1; i <= (int.parse(agent.insPosts) ~/ 26); i++) {
        values[index][4].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    }
    //**************************insRells*******************************
    if ((int.parse(agent.insRells) ~/ 26) < 1 && agent.insRells != '0') {
      values[index][5].add(false.obs);
      int x = int.parse(agent.reports);
      agent.reports = (x + 1).toString();
      allReports++;
    } else {
      for (int i = 1; i <= (int.parse(agent.insRells) ~/ 26); i++) {
        values[index][5].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    }
    //**************************insStorys*******************************
    if ((int.parse(agent.insStorys) ~/ 26) < 1 && agent.insStorys != '0') {
      values[index][6].add(false.obs);
      int x = int.parse(agent.reports);
      agent.reports = (x + 1).toString();
      allReports++;
    } else {
      for (int i = 1; i <= (int.parse(agent.insStorys) ~/ 26); i++) {
        values[index][6].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    }
    //**************************insHighlight*******************************
    if ((int.parse(agent.insHighlight) ~/ 26) < 1 &&
        agent.insHighlight != '0') {
      values[index][7].add(false.obs);
      int x = int.parse(agent.reports);
      agent.reports = (x + 1).toString();
      allReports++;
    } else {
      for (int i = 1; i <= (int.parse(agent.insHighlight) ~/ 26); i++) {
        values[index][7].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    }
    //**************************insVideos*******************************
    if ((int.parse(agent.insVideos) ~/ 26) < 1 && agent.insVideos != '0') {
      values[index][8].add(false.obs);
      int x = int.parse(agent.reports);
      agent.reports = (x + 1).toString();
      allReports++;
    } else {
      for (int i = 1; i <= (int.parse(agent.insVideos) ~/ 26); i++) {
        values[index][8].add(false.obs);
        int x = int.parse(agent.reports);
        agent.reports = (x + 1).toString();
        allReports++;
      }
    }
    // //**************************WebSite*******************************/
    // //**************************wbVideos*******************************/
    // if ((int.parse(agent.wbVideos) ~/ 26) < 1 && agent.wbVideos != '0') {
    //   values[index][9].add(false.obs);
    //   int x = int.parse(agent.reports);
    //   agent.reports = (x + 1).toString();
    //   allReports++;
    // } else {
    //   for (int i = 1; i <= (int.parse(agent.wbVideos) ~/ 26); i++) {
    //     values[index][9].add(false.obs);
    //     int x = int.parse(agent.reports);
    //     agent.reports = (x + 1).toString();
    //     allReports++;
    //   }
    // }
    // //**************************wbPhotos*******************************/
    // if ((int.parse(agent.wbPhotos) ~/ 26) < 1 && agent.wbPhotos != '0') {
    //   values[index][10].add(false.obs);
    //   int x = int.parse(agent.reports);
    //   agent.reports = (x + 1).toString();
    //   allReports++;
    // } else {
    //   for (int i = 1; i <= (int.parse(agent.wbPhotos) ~/ 26); i++) {
    //     values[index][10].add(false.obs);
    //     int x = int.parse(agent.reports);
    //     agent.reports = (x + 1).toString();
    //     allReports++;
    //   }
    // }
    // //**************************wbBlog*******************************/
    // if ((int.parse(agent.wbBlog) ~/ 26) < 1 && agent.wbBlog != '0') {
    //   values[index][11].add(false.obs);
    //   int x = int.parse(agent.reports);
    //   agent.reports = (x + 1).toString();
    //   allReports++;
    // } else {
    //   for (int i = 1; i <= (int.parse(agent.wbBlog) ~/ 26); i++) {
    //     values[index][11].add(false.obs);
    //     int x = int.parse(agent.reports);
    //     agent.reports = (x + 1).toString();
    //     allReports++;
    //   }
    // }
    // //**************************Youtube*******************************/
    // //**************************ytVideos*******************************/
    // if ((int.parse(agent.ytVideos) ~/ 26) < 1 && agent.ytVideos != '0') {
    //   values[index][12].add(false.obs);
    //   int x = int.parse(agent.reports);
    //   agent.reports = (x + 1).toString();
    //   allReports++;
    // } else {
    //   for (int i = 1; i <= (int.parse(agent.ytVideos) ~/ 26); i++) {
    //     values[index][12].add(false.obs);
    //     int x = int.parse(agent.reports);
    //     agent.reports = (x + 1).toString();
    //     allReports++;
    //   }
    // }
    // //**************************ytShorts*******************************/
    // if ((int.parse(agent.ytShorts) ~/ 26) < 1 && agent.ytShorts != '0') {
    //   values[index][13].add(false.obs);
    //   int x = int.parse(agent.reports);
    //   agent.reports = (x + 1).toString();
    //   allReports++;
    // } else {
    //   for (int i = 1; i <= (int.parse(agent.ytShorts) ~/ 26); i++) {
    //     values[index][13].add(false.obs);
    //     int x = int.parse(agent.reports);
    //     agent.reports = (x + 1).toString();
    //     allReports++;
    //   }
    // }
    // //**************************Design*******************************/
    // //**************************dsCover*******************************/
    // if ((int.parse(agent.dsCover) ~/ 26) < 1 && agent.dsCover != '0') {
    //   values[index][14].add(false.obs);
    //   int x = int.parse(agent.reports);
    //   agent.reports = (x + 1).toString();
    //   allReports++;
    // } else {
    //   for (int i = 1; i <= (int.parse(agent.dsCover) ~/ 26); i++) {
    //     values[index][14].add(false.obs);
    //     int x = int.parse(agent.reports);
    //     agent.reports = (x + 1).toString();
    //     allReports++;
    //   }
    // }
    // //**************************dsFrame*******************************/
    // if ((int.parse(agent.dsFrame) ~/ 26) < 1 && agent.dsFrame != '0') {
    //   values[index][15].add(false.obs);
    //   int x = int.parse(agent.reports);
    //   agent.reports = (x + 1).toString();
    //   allReports++;
    // } else {
    //   for (int i = 1; i <= (int.parse(agent.dsFrame) ~/ 26); i++) {
    //     values[index][15].add(false.obs);
    //     int x = int.parse(agent.reports);
    //     agent.reports = (x + 1).toString();
    //     allReports++;
    //   }
    // }
    // //**************************dsPosts*******************************/
    // if ((int.parse(agent.dsPosts) ~/ 26) < 1 && agent.dsPosts != '0') {
    //   values[index][16].add(false.obs);
    //   int x = int.parse(agent.reports);
    //   agent.reports = (x + 1).toString();
    //   allReports++;
    // } else {
    //   for (int i = 1; i <= (int.parse(agent.dsPosts) ~/ 26); i++) {
    //     values[index][16].add(false.obs);
    //     int x = int.parse(agent.reports);
    //     agent.reports = (x + 1).toString();
    //     allReports++;
    //   }
    // }
  }
  //  print(list.where((x) => x == true).length);
}
