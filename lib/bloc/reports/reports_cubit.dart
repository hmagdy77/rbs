import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../libraries.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsStateInit());
  List<Report> allReports = [];
  List<Report> agentReports = [];
  List<Report> rangedReports = [];
  String startDate = '';
  String endDate = '';
  String endDateSend = '';
  var dateFormatter = DateFormat('yyyy-MM-dd');
  var formatter = DateFormat('dd-MM-yyyy');
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
  int fbPostsSum = 0;
  int fbRellsSum = 0;
  int fbStorysSum = 0;
  int fbVideosSum = 0;
  int insPostsSum = 0;
  int insRellsSum = 0;
  int insStorysSum = 0;
  int insVideosSum = 0;
  int insHighlightSum = 0;
  int wbBlogSum = 0;
  int wbphotosSum = 0;
  int wbVideosSum = 0;
  int ytShortsSum = 0;
  int ytVideosSum = 0;
  int dsFrameSum = 0;
  int dsCoverSum = 0;
  int dsPostsSum = 0;

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

  addReport(
      {required context,
      required String agentId,
      required String byEmp}) async {
    emit(ReportsStateLoading());
    try {
      var addReportRepo = await ReportsRepo.addReport(
        agentId: agentId,
        byEmp: byEmp,
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
      if (addReportRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        clearTextFields();
        emit(ReportsStateChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(ReportsStateFail());
      }
    } catch (e) {
      emit(ReportsStateError());
      showSnak(context: context, type: 0);
    }
  }

  getReports({
    required int agentId,
  }) async {
    emit(ReportsStateLoading());
    try {
      var date = await ReportsRepo.viewReport();
      if (date.status == 'suc') {
        allReports.clear();
        allReports.addAll(date.data);
        sortReports(agentId: agentId);
        emit(ReportsStateSucsses());
      } else {
        emit(ReportsStateFail());
      }
    } catch (e) {
      emit(ReportsStateError());
    }
  }

  changeDate({required DateTime date, required String kind}) {
    if (kind == '1') {
      startDate = dateFormatter.format(date);
    } else {
      endDate = dateFormatter.format(date);
      endDateSend =
          '${date.year}-${date.month}-${date.day} 11:59:59'; //dateFormatter.format(date);
    }
    emit(ReportsStateChanged());
  }

  getReportsfromRange({
    required int agentId,
  }) async {
    emit(ReportsStateLoading());
    try {
      var reports = await ReportsRepo.dateReports(
        agentId: agentId.toString(),
        start: startDate,
        end: endDateSend,
      );
      if (reports.status == 'suc') {
        rangedReports.clear();
        rangedReports.addAll(reports.data);
        sum(reportsList: rangedReports);
        emit(ReportsStateSucsses());
      } else {
        emit(ReportsStateFail());
      }
    } catch (e) {
      emit(ReportsStateError());
    }
  }

  sortReports({required int agentId}) async {
    agentReports.clear();
    agentReports = allReports
        .where(
          (report) {
            int id = int.parse(report.agentId);
            return id == agentId;
          },
        )
        .toList()
        .reversed
        .toList();
  }

  prepareTextFields({required Report report}) {
    fbPosts.text = report.fbPosts;
    fbRells.text = report.fbRells;
    fbStorys.text = report.fbStorys;
    fbVideos.text = report.fbVideos;
    insPosts.text = report.insPosts;
    insRells.text = report.insRells;
    insStorys.text = report.insStorys;
    insVideos.text = report.insVideos;
    insHighlight.text = report.insHighlight;
    ytVideos.text = report.ytVideos;
    ytShorts.text = report.ytShorts;
    wbBlog.text = report.wbBlog;
    wbVideos.text = report.wbVideos;
    wbphotos.text = report.wbPhotos;
    dsCover.text = report.dsCover;
    dsFrame.text = report.dsFrame;
    dsPosts.text = report.dsPosts;
  }

  clearTextFields() {
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

  editReport({
    required String id,
    required String agentId,
    required context,
  }) async {
    emit(ReportsStateLoading());
    try {
      var editReportRepo = await ReportsRepo.editReport(
        id: id,
        agentId: agentId,
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
      if (editReportRepo.status == 'suc') {
        showSnak(context: context, type: 1);
        // Navigator.pushReplacementNamed(context, AppRoutes.mainRoot);
        emit(ReportsStateChanged());
      } else {
        showSnak(context: context, type: 0);
        emit(ReportsStateFail());
      }
    } catch (e) {
      emit(ReportsStateError());
      showSnak(context: context, type: 0);
    }
  }

  deleteReport({
    required String id,
    required context,
  }) async {
    showSnakConfirm(
      context: context,
      onTap: () async {
        emit(ReportsStateLoading());
        try {
          var deleteReportRepo = await ReportsRepo.deleteReport(id: id);
          if (deleteReportRepo.status == 'suc') {
            showSnak(context: context, type: 1);
            emit(ReportsStateChanged());
          } else {
            showSnak(context: context, type: 0);
            emit(ReportsStateFail());
          }
        } catch (e) {
          emit(ReportsStateError());
          showSnak(context: context, type: 0);
        }
      },
    );
  }

  sum({required List<Report> reportsList}) {
    // ins
    fbPostsSum = 0;
    fbRellsSum = 0;
    fbStorysSum = 0;
    fbVideosSum = 0;
    // ins
    insPostsSum = 0;
    insRellsSum = 0;
    insStorysSum = 0;
    insVideosSum = 0;
    insHighlightSum = 0;
    // ds
    dsPostsSum = 0;
    dsCoverSum = 0;
    dsFrameSum = 0;
    // wb
    wbBlogSum = 0;
    wbVideosSum = 0;
    wbphotosSum = 0;
    // yt
    ytShortsSum = 0;
    ytVideosSum = 0;
    for (int i = 0; i < reportsList.length; i++) {
      fbPostsSum += int.parse(reportsList[i].fbPosts);
      fbRellsSum += int.parse(reportsList[i].fbRells);
      fbStorysSum += int.parse(reportsList[i].fbStorys);
      fbVideosSum += int.parse(reportsList[i].fbVideos);
      // ins
      insPostsSum += int.parse(reportsList[i].insPosts);
      insRellsSum += int.parse(reportsList[i].insRells);
      insStorysSum += int.parse(reportsList[i].insStorys);
      insVideosSum += int.parse(reportsList[i].insVideos);
      insHighlightSum += int.parse(reportsList[i].insHighlight);
      // ds
      dsCoverSum += int.parse(reportsList[i].dsCover);
      dsFrameSum += int.parse(reportsList[i].dsFrame);
      dsPostsSum += int.parse(reportsList[i].dsPosts);
      // wb
      wbBlogSum += int.parse(reportsList[i].wbBlog);
      wbVideosSum += int.parse(reportsList[i].wbVideos);
      wbphotosSum += int.parse(reportsList[i].wbPhotos);
      // yt
      ytShortsSum += int.parse(reportsList[i].ytShorts);
      ytVideosSum += int.parse(reportsList[i].ytVideos);
    }
  }

  clearSum() {
    fbPostsSum = 0;
    fbRellsSum = 0;
    fbStorysSum = 0;
    fbVideosSum = 0;
    insPostsSum = 0;
    insRellsSum = 0;
    insStorysSum = 0;
    insVideosSum = 0;
    insHighlightSum = 0;
    wbBlogSum = 0;
    wbphotosSum = 0;
    wbVideosSum = 0;
    ytShortsSum = 0;
    ytVideosSum = 0;
    dsFrameSum = 0;
    dsCoverSum = 0;
    dsPostsSum = 0;
  }
}
