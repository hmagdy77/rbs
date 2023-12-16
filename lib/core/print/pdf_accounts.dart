import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../constants/app_strings.dart';

Future<void> printAccounts({
  required List<List<String>> items,
  required String agentName,
  required String rewnableDate,
  required String start,
  required String end,
  required String emp,
}) async {
  final Document pdf = Document();

  var arabicFont =
      Font.ttf(await rootBundle.load("assets/fonts/arabic/arabic.ttf"));

  final footer = MemoryImage(
    (await rootBundle.load('assets/images/footer.jpg')).buffer.asUint8List(),
  );

  final header = MemoryImage(
    (await rootBundle.load('assets/images/hed-Acc.jpg')).buffer.asUint8List(),
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
                          'Agent name',
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
                          'Renewal date',
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
                            rewnableDate,
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TableHelper.fromTextArray(
                headerStyle: const TextStyle(
                  fontSize: 10,
                ),
                headerDecoration: BoxDecoration(color: mainColor),
                cellDecoration: (index, data, rowNum) {
                  return BoxDecoration(color: secondColor);
                },
                headerAlignment: Alignment.center,
                headers: <dynamic>[
                  AppStrings.kind,
                  AppStrings.price,
                  AppStrings.date,
                  AppStrings.desc,
                  AppStrings.name,
                ],
                cellAlignment: Alignment.center,
                cellStyle: const TextStyle(
                  fontSize: 10,
                ),
                data: items,
              ),
            ),
          ),
          SizedBox(height: 10),
        ];
      },
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
