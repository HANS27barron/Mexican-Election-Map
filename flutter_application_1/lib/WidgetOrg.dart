import 'package:flutter/material.dart';
import 'package:flutter_application_1/DataWidget.dart';
import 'package:flutter_application_1/MexicoMap.dart';

class WidgetOrg extends StatelessWidget {

  final ValueNotifier<String> selectedState;
  final ValueNotifier<String> year;

  const WidgetOrg({required this.selectedState, required this.year});

  Widget build(BuildContext context){
    return ValueListenableBuilder(valueListenable: selectedState, builder: (context, x, _){
      return ValueListenableBuilder(valueListenable: year, builder: (context, y, _){
    return Scaffold(backgroundColor: Color.fromARGB(255, 13, 41, 19), 
    body: Container(child: Column(children: [SizedBox(height: 20), Row(
        children: [
          MexicoMap(selectedState: selectedState), SizedBox(width: 60,), 
          DataWidget(selectedState: selectedState, year: year)
          ])]))
          );
  });
});
}}
