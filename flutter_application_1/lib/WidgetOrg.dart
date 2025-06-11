// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, annotate_overrides, use_key_in_widget_constructors

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
    return Scaffold(backgroundColor: Color.fromARGB(255, 2, 5, 19), 
    body: Container(child: Column(children: [SizedBox(height: 20), Row(
        children: [
          MexicoMap(selectedState: selectedState, year: year,), SizedBox(width: 60,), 
          DataWidget(selectedState: selectedState, year: year)
          ])]))
          );
  });
});
}}
