import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:excel/excel.dart';

Future<void> dataExtraction(String year) async {

  ByteData data = await rootBundle.load('assets/elecciones$year.xlsx');
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  final String firstSheetName = excel.tables.keys.first;
  final Sheet? sheet = excel.tables[firstSheetName];

  Map<String, Map<String, int>> stateVotes = {};

  String party1 =  sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value.toString();
  String party2 = sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: 0)).value.toString();
  String party3 = sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: 0)).value.toString();

      for (int i = 1; i < sheet!.maxRows; i++) {
      var row = sheet.row(i);

      String? state = row[1]?.value?.toString();
      int? party1Votes = int.tryParse(row[6]?.value.toString() ?? '');
      int? party2Votes = int.tryParse(row[7]?.value.toString() ?? '');
      int? party3Votes = int.tryParse(row[8]?.value.toString() ?? '');

      if (state == null) continue;

      stateVotes.putIfAbsent(state, () => {
        party1: 0,
        party2: 0,
        party3: 0,
      });

      if (party1Votes != null) stateVotes[state]![party1] = stateVotes[state]![party1]! + party1Votes;
      if (party2Votes != null) stateVotes[state]![party2] = stateVotes[state]![party2]! + party2Votes;
      if (party3Votes != null) stateVotes[state]![party3] = stateVotes[state]![party3]! + party3Votes;
    }

    for (var entry in stateVotes.entries) {
  String state = entry.key;
  Map<String, int> votesMap = entry.value;

  // Sort parties by vote count in descending order
  var sortedParties = votesMap.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  print('\n$state:');
  for (var e in sortedParties) {
    print('${e.key}: ${e.value}');
  }
}

  print(firstSheetName);
  print(stateVotes);
}