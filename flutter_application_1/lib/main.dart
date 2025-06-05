import 'package:flutter/material.dart';
import "HomePage.dart";
import 'package:flutter/services.dart' show rootBundle;
import 'package:excel/excel.dart';

void main() {
  runApp(const MyApp());
  Future<void> printExcelHeaders() async {
  var bytes = await rootBundle.load('assets/elecciones2006.xlsx');
  var excel = Excel.decodeBytes(bytes.buffer.asUint8List());

  for (var sheetName in excel.tables.keys) {
    var sheet = excel.tables[sheetName];
    if (sheet == null) continue;

    print('Sheet: $sheetName');

    var headerRow = sheet.rows.isNotEmpty ? sheet.rows[0] : null;
    if (headerRow != null) {
      // Print the header values
      var headers = headerRow.map((cell) => cell?.value).toList();
      print('Headers: $headers');
    }
  }
}
print("H");

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Websitee',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
