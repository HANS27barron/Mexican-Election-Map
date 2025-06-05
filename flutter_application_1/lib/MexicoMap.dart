import 'package:flutter/material.dart';
import "package:countries_world_map/countries_world_map.dart";



class MexicoMap extends StatelessWidget {
  const MexicoMap({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 13, 41, 19), 
      body: Row(
        
        children: [
          SizedBox(width: 30,),
          Container(
            width: 800,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
             SimpleMap(
              instructions: SMapMexico.instructions, // Mexico map instructions
              countryBorder: CountryBorder(color: Color.fromARGB(106, 0, 0, 0)),
              defaultColor: Color.fromARGB(255, 228, 223, 223), // Default color for other areas (if any)
              colors: SMapMexicoColors(
              ).toMap(),
              callback: (id, name, tapDetails) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped: $name')),
                );
              },
            ),
    ]))]),
    );
  }
}
