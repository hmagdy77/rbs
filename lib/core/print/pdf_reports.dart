import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../constants/app_strings.dart';

Future<void> printReports({
  // Facebook
  required String fPost,
  required String fStory,
  required String fVideo,
  required String fRells,
//  Instgram
  required String insPost,
  required String insStory,
  required String insVideo,
  required String insRells,
  required String insHeiglights,
// Design
  required String dPost,
  required String dCover,
  required String dFreame,
  // Website
  required String wVideo,
  required String wBlog,
  required String wPhotos,
  // Youtube
  required String yVideo,
  required String yShorts,

  ///
  required String today,
  required String start,
  required String end,
  required String emp,
  required String agentName,
}) async {
  final Document pdf = Document();

  var arabicFont =
      Font.ttf(await rootBundle.load("assets/fonts/arabic/arabic.ttf"));

  final footer = MemoryImage(
    (await rootBundle.load('assets/images/footer.jpg')).buffer.asUint8List(),
  );

  final header = MemoryImage(
    (await rootBundle.load('assets/images/hed.jpg')).buffer.asUint8List(),
  );

  final PdfColor mainColor = PdfColor.fromHex('#c6efff');
  final PdfColor secondColor = PdfColor.fromHex('#edfaff');
  final PdfColor thirdColor = PdfColor.fromHex('#004e71');
  final PdfColor whiteColor = PdfColor.fromHex('#fbfafb');

  pdf.addPage(
    MultiPage(
      theme: ThemeData.withFont(
        base: arabicFont,
      ),
      crossAxisAlignment: CrossAxisAlignment.center,
      margin: const EdgeInsets.all(35),
      pageFormat: PdfPageFormat.a4,
      footer: (context) {
        return Container(
          height: 170,
          width: double.infinity,
          child: Image(footer, fit: BoxFit.fill),
        );
      },
      build: (Context context) {
        return [
          Container(
            height: 170,
            width: double.infinity,
            child: Image(header, fit: BoxFit.fill),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(color: mainColor),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Center(
                        child: Text(
                          'Agent Name',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(color: mainColor),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Center(
                        child: Text(
                          'Date',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(color: mainColor),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Center(
                        child: Text(
                          'prepared by',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Container(
                color: secondColor,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      // decoration: BoxDecoration(color: secondColor),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Text(
                            agentName,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      width: 150,
                      // decoration: BoxDecoration(color: secondColor),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Text(
                            today,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      width: 150,
                      // decoration: BoxDecoration(color: secondColor),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Text(
                            emp,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: mainColor,
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: 1,
                          color: mainColor,
                        ),
                      ),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Center(
                        child: Text(
                          'Reporting period',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 90,
                    width: 150,
                    decoration: BoxDecoration(
                      color: secondColor,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Center(
                        child: Text(
                          '$end  :  $start',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 38,
            width: double.infinity,
            decoration: BoxDecoration(
              color: thirdColor,
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                '   STATUS REPORT',
                style: TextStyle(
                    fontSize: 24,
                    fontBold: Font.courierBold(),
                    color: whiteColor),
              ),
            ),
          ),
          SizedBox(height: 10),
          //the TableHelper
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fPost == '0' && fStory == '0' && fRells == '0' && fVideo == '0'
                  ? SizedBox()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TableHelper.fromTextArray(
                          headerStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          headerDecoration: BoxDecoration(color: mainColor),
                          cellDecoration: (index, data, rowNum) {
                            return BoxDecoration(color: secondColor);
                          },
                          cellPadding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 6,
                          ),
                          headerAlignment: Alignment.center,
                          headers: <dynamic>[
                            AppStrings.facebook,
                          ],
                          cellAlignment: Alignment.center,
                          cellStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          data: [
                            fPost != '0' ? [AppStrings.posts, fPost] : [],
                            fStory != '0' ? [AppStrings.storys, fStory] : [],
                            fRells != '0' ? [AppStrings.rells, fRells] : [],
                            fVideo != '0' ? [AppStrings.videos, fVideo] : [],
                          ],
                        ),
                      ),
                    ),
              insPost == '0' &&
                      insStory == '0' &&
                      insRells == '0' &&
                      insVideo == '0' &&
                      insHeiglights == '0'
                  ? SizedBox()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TableHelper.fromTextArray(
                          headerStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          headerDecoration: BoxDecoration(color: mainColor),
                          cellPadding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 6,
                          ),
                          cellDecoration: (index, data, rowNum) {
                            return BoxDecoration(color: secondColor);
                          },
                          headerAlignment: Alignment.center,
                          headers: <dynamic>[
                            AppStrings.instgram,
                          ],
                          cellAlignment: Alignment.center,
                          cellStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          data: [
                            insPost != '0' ? [AppStrings.posts, insPost] : [],
                            insStory != '0'
                                ? [AppStrings.storys, insStory]
                                : [],
                            insRells != '0' ? [AppStrings.rells, insRells] : [],
                            insVideo != '0'
                                ? [AppStrings.videos, insVideo]
                                : [],
                            insHeiglights != '0'
                                ? [AppStrings.highlight, insHeiglights]
                                : [],
                          ],
                        ),
                      ),
                    ),
              dPost == '0' && dFreame == '0' && dCover == '0'
                  ? SizedBox()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TableHelper.fromTextArray(
                          headerStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          headerDecoration: BoxDecoration(color: mainColor),
                          cellDecoration: (index, data, rowNum) {
                            return BoxDecoration(color: secondColor);
                          },
                          cellPadding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 6,
                          ),
                          headerAlignment: Alignment.center,
                          headers: <dynamic>[
                            AppStrings.design,
                          ],
                          cellAlignment: Alignment.center,
                          cellStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          data: [
                            dPost != '0' ? [AppStrings.posts, dPost] : [],
                            dCover != '0' ? [AppStrings.cover, dCover] : [],
                            dFreame != '0' ? [AppStrings.frame, dFreame] : [],
                          ],
                        ),
                      ),
                    ),
              wBlog == '0' && wPhotos == '0' && wVideo == '0'
                  ? SizedBox()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TableHelper.fromTextArray(
                          headerStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          headerDecoration: BoxDecoration(color: mainColor),
                          cellDecoration: (index, data, rowNum) {
                            return BoxDecoration(color: secondColor);
                          },
                          cellPadding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 6,
                          ),
                          headerAlignment: Alignment.center,
                          headers: <dynamic>[
                            AppStrings.website,
                          ],
                          cellAlignment: Alignment.center,
                          cellStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          data: [
                            wBlog != '0' ? [AppStrings.blog, wBlog] : [],
                            wPhotos != '0' ? [AppStrings.photos, wPhotos] : [],
                            wVideo != '0' ? [AppStrings.videos, wVideo] : [],
                          ],
                        ),
                      ),
                    ),
              yVideo == '0' && yShorts == '0'
                  ? SizedBox()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TableHelper.fromTextArray(
                          headerStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          headerDecoration: BoxDecoration(color: mainColor),
                          cellDecoration: (index, data, rowNum) {
                            return BoxDecoration(color: secondColor);
                          },
                          cellPadding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 6,
                          ),
                          headerAlignment: Alignment.center,
                          headers: <dynamic>[
                            AppStrings.youtube,
                          ],
                          cellAlignment: Alignment.center,
                          cellStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          data: [
                            yVideo != '0' ? [AppStrings.videos, yVideo] : [],
                            yShorts != '0' ? [AppStrings.photos, yShorts] : [],
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          SizedBox(height: 10),
        ];
      },
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
