import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:excel/excel.dart';
import 'package:flutter_application_1/PartyData.dart';

/* class dataExtraction extends StatefulWidget {
  final ValueNotifier<String> year;
  const dataExtraction({required this.year});

  @override
  State<dataExtraction> createState() => _dataExtractionState();
} */

class dataExtraction extends StatelessWidget  {
  final ValueNotifier<String> year;
  final ValueNotifier<String> selectedState;
  const dataExtraction({required this.year, required this.selectedState});

  Future getResults() async {
  ByteData data = await rootBundle.load('assets/elecciones${year.value}.xlsx');
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  final String firstSheetName = excel.tables.keys.first;
  final Sheet? sheet = excel.tables[firstSheetName];

  Map<String, Map<String, int>> stateVotes = {};

  String party1 =  sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: 0)).value.toString();
  String party2 = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: 0)).value.toString();
  String party3 = sheet.cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: 0)).value.toString();

      for (int i = 1; i < sheet.maxRows; i++) {
      var row = sheet.row(i);

      String? state = row[1]?.value?.toString();
      int? party1Votes = int.tryParse(row[7]?.value.toString() ?? '');
      int? party2Votes = int.tryParse(row[8]?.value.toString() ?? '');
      int? party3Votes = int.tryParse(row[9]?.value.toString() ?? '');

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

  return stateVotes;
}

 @override
Widget build(BuildContext context) {
  return FutureBuilder(
    future: getResults(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return SizedBox(child: Center(child:  CircularProgressIndicator(color: Color.fromARGB(255, 171, 8, 32),)), height: 100); // Show loading indicator
      } else if (snapshot.hasData) {
      final Map<String, Map<String, int>> results = snapshot.data;
      final Map<String, int>? selectedVotes = results[selectedState.value];
      final sortedVotes = selectedVotes!.entries.toList()
      ..sort((a, b) => b.value.toInt().compareTo(a.value.toInt()));
      final winnerString = "${sortedVotes[0].key}${year.value}";
         return Padding (padding: EdgeInsets.symmetric(vertical:20, horizontal: 20),
         child: Column(children: [
          PartyData.winner[winnerString]!,
        ...sortedVotes.map((entry) {
            final image = PartyData.images[entry.key];
            final totalVotes = sortedVotes.fold<int>(0, (sum, entry) => sum + entry.value);
            final percentage = ((entry.value/totalVotes)*100).toStringAsPrecision(4);
            return Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20), child: 
              Row(
                children: [
                  image ?? Icon(Icons.flag), 
                  SizedBox(width: 12),
                  Text(entry.key,  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: PartyData.colors[entry.key])), 
                  SizedBox(width: 40), 
                  Text("$percentage%", style:TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  SizedBox(width: 20),
                  Text("${(entry.value)} votos", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                ],
            ));
          }).toList(),
  ]));
      } else if (snapshot.hasError) {
        return Text("");
      } else {
        return Text("No data found.");
      }
    },
  );
}
  }