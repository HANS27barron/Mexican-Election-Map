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
    return Scaffold(backgroundColor: Color.fromARGB(255, 12, 12, 12), 
    body: Container(child: Column(children: [SizedBox(height: 20), 
    SizedBox(height: MediaQuery.of(context).size.height * 0.83, width: MediaQuery.of(context).size.width*1,
    child:  ListView(scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width*0.58, 
            child: MexicoMap(selectedState: selectedState, year: year,),), 
          SizedBox(width: MediaQuery.of(context).size.width*0.04),
          SizedBox(width: MediaQuery.of(context).size.width*0.32, 
            child: DataWidget(selectedState: selectedState, year: year))
          ]))]))
          );
  });
});
}}
