import '../../../libraries.dart';

class Scrolable extends StatelessWidget {
  Scrolable({super.key, required this.columns, required this.rows});
  final List<DataColumn> columns;
  final List<DataRow> rows;
  // final List<int> shades = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 500,
      // width: 400,
      child: Scrollbar(
        controller: _vertical,
        thumbVisibility: true,
        trackVisibility: true,
        child: Scrollbar(
          controller: _horizontal,
          thumbVisibility: true,
          trackVisibility: true,
          notificationPredicate: (notif) => notif.depth == 1,
          child: SingleChildScrollView(
            controller: _vertical,
            child: SingleChildScrollView(
              controller: _horizontal,
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: columns,
                  //   const <DataColumn>[
                  //   DataColumn(label: Text('Preview')),
                  //   DataColumn(label: Text('Color')),
                  //   DataColumn(label: Text('Shade')),
                  // ],
                  rows: rows),
            ),
          ),
        ),
      ),
    );
  }
}

// [
//                   for (var item in rows)
//                     DataRow(
//                       cells: [
//                         DataCell(Container(height: 20, width: 50, color: color[shade])),
//                         DataCell(Text(color.toString())),
//                         DataCell(Text('$shade')),
//                       ],
//                     ),
//                 ],

class ScrolableWithChild extends StatelessWidget {
  ScrolableWithChild({super.key, required this.child});
  final Widget child;
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 500,
      // width: 400,
      child: Scrollbar(
        controller: _vertical,
        thumbVisibility: true,
        trackVisibility: true,
        child: Scrollbar(
          controller: _horizontal,
          thumbVisibility: true,
          trackVisibility: true,
          notificationPredicate: (notif) => notif.depth == 1,
          child: SingleChildScrollView(
            controller: _vertical,
            child: SingleChildScrollView(
              controller: _horizontal,
              scrollDirection: Axis.horizontal,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

// [
//                   for (var item in rows)
//                     DataRow(
//                       cells: [
//                         DataCell(Container(height: 20, width: 50, color: color[shade])),
//                         DataCell(Text(color.toString())),
//                         DataCell(Text('$shade')),
//                       ],
//                     ),
//                 ],
