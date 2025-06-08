import 'package:flutter/material.dart';
import "package:countries_world_map/countries_world_map.dart";
import 'package:flutter_application_1/DataWidget.dart';
import 'package:flutter_application_1/MexicoMap.dart';

class WidgetOrg extends StatelessWidget {

  final ValueNotifier<String> selectedState;
  final ValueNotifier<String> results;


  const WidgetOrg({required this.selectedState, required this.results});

  Widget build(BuildContext context){
    return ValueListenableBuilder(valueListenable: selectedState, builder: (context, value, _){
    return Scaffold(backgroundColor: Color.fromARGB(255, 13, 41, 19), 
    body: Container(child: Column(children: [SizedBox(height: 20), Row(
        children: [
          MexicoMap(selectedState: selectedState, results: results,), SizedBox(width: 60,), DataWidget(selectedState: selectedState, results: results,)])]))
          );
  });
}
}
