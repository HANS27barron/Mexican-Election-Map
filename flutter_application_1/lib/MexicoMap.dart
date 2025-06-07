import 'package:flutter/material.dart';
import "package:countries_world_map/countries_world_map.dart";
import 'package:flutter_application_1/DataWidget.dart';

class MexicoMap extends StatefulWidget {

  final ValueNotifier<String> selectedState;

  const MexicoMap({required this.selectedState});  // accept the notifier

  @override
  State<MexicoMap> createState() => _MexicoMapState();
}

class _MexicoMapState extends State<MexicoMap> {

  Map<String, Color> partyColors = {
    "PAN": Color.fromARGB(255, 14, 39, 185),
    "AC": Color.fromARGB(255, 14, 39, 185),
    "PAN_PRD_MC_CAND": Color.fromARGB(255, 14, 39, 185),
    "PRI": Color.fromARGB(255, 24, 185, 3),
    "PRD": Color.fromARGB(255, 232, 198, 6),
    "PT_MORENA_ES_CAND": Color.fromARGB(255, 144, 1, 42)
  };

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
