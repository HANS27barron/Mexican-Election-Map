import 'package:flutter/material.dart';
import "package:countries_world_map/countries_world_map.dart";

class MexicoMap extends StatefulWidget {

  final ValueNotifier<String> selectedState;

  const MexicoMap({required this.selectedState});  // accept the notifier

  @override
  State<MexicoMap> createState() => _MexicoMapState();
}

class _MexicoMapState extends State<MexicoMap> {

  String? tappedState;

  @override
  Widget build(BuildContext context) {
    return SimpleMap(
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
                  widget.selectedState.value=name;
                  
                  
                }
              });
              },

              onHover: (id, name, tapDetails) {
                if(tappedState==null){
                  widget.selectedState.value=name;
                }
              },
              
            );
  }
}
