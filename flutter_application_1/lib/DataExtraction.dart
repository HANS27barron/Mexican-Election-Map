// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, unnecessary_to_list_in_spreads

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:excel/excel.dart';
import 'package:flutter_application_1/PartyData.dart';


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
  return LayoutBuilder(builder: (context, constraints){
    final screenHeight = constraints.maxHeight;
    final screenWidth = constraints.maxWidth;

    return FutureBuilder(
      future: getResults(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(height:screenHeight*0.1, child: Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 163, 163, 163),))); // Show loading indicator
        } 
        
        else if (snapshot.hasData) {
          final Map<String, Map<String, int>> results = snapshot.data;
          final Map<String, int>? selectedVotes = results[selectedState.value];
          final sortedVotes = selectedVotes!.entries.toList()
          ..sort((a, b) => b.value.toInt().compareTo(a.value.toInt()));
          final winnerString = "${sortedVotes[0].key}${year.value}";

            return SingleChildScrollView(scrollDirection: Axis.vertical, child: 
                Padding (padding: EdgeInsets.symmetric(vertical:screenHeight*0.01, horizontal: screenWidth*0.04),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [SizedBox( height: screenHeight*0.3, child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: 
                  PartyData.winner[winnerString]!)),
                ...sortedVotes.map((entry) {
                    final image = PartyData.images[entry.key];
                    final totalVotes = sortedVotes.fold<int>(0, (sum, entry) => sum + entry.value);
                    final percentage = ((entry.value/totalVotes)*100).toStringAsPrecision(4);
                return Padding(padding: EdgeInsets.symmetric(vertical: screenHeight*0.025, horizontal: screenWidth*0.01), child: 
                  FittedBox(fit: BoxFit.scaleDown, child: Row(
                    children: [
                      SizedBox(height: screenHeight*0.15, child:  image ?? Icon(Icons.flag)), 
                      SizedBox(width: screenWidth*0.03),
                      Text(entry.key,  style: TextStyle(fontSize: screenHeight*0.055, fontWeight: FontWeight.bold, color: PartyData.colors[entry.key])), 
                      SizedBox(width: screenWidth*0.075), 
                      Text("$percentage%", style:TextStyle(fontSize: screenHeight*0.04, fontWeight: FontWeight.w600, color: Colors.white)),
                      SizedBox(width: screenWidth*0.06),
                      Text("${(entry.value)} votos", style: TextStyle(fontSize: screenHeight*0.03, fontWeight: FontWeight.w600, color: Colors.white)),
                    ],
                )));
              }).toList(),
      ])));
        } else if (snapshot.hasError) {
          return Text("");
        } else {
          return Text("No data found.");
        }
      },
    );
});
}}