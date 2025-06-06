import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:excel/excel.dart';

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

print("H");
}