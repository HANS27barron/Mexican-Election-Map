import 'package:flutter/material.dart';
import "package:countries_world_map/countries_world_map.dart";
import 'package:flutter_application_1/DataWidget.dart';

class MexicoMap extends StatefulWidget {
  @override
  State<MexicoMap> createState() => _MexicoMapState();
}

class _MexicoMapState extends State<MexicoMap> {

  final ValueNotifier<String> selectedState = ValueNotifier("");
  String? tappedState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 13, 41, 19), 
      body: Row(
        children: [
          SizedBox(width: 0),
          Container(
            width: 800,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
             SimpleMap(
              instructions: SMapMexico.instructions, // Mexico map instructions
              countryBorder: CountryBorder(color: Color.fromARGB(255, 0, 0, 0)),
              defaultColor: Color.fromARGB(255, 228, 223, 223), // Default color for other areas (if any)
              colors: SMapMexicoColors(
              ).toMap(),

              callback: (id, name, tapDetails){
                setState((){
                  if(tappedState==id){
                  tappedState=null;
                } else {
                  tappedState=id;
                  selectedState.value=name;
                  
                }
              });
              },

              onHover: (id, name, tapDetails) {
                if(tappedState==null){
                  selectedState.value=name;
                }
              },


            ),
    ])), SizedBox(width: 60,), DataWidget(selectedState: selectedState)]),
    );
  }
}
