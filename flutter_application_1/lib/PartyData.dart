import 'package:flutter/material.dart';


class PartyData {

  static Map<String, Image> images = {
    "PAN": Image(image: AssetImage("assets/PAN.png"), width: 75, height: 75,),
    "PRI": Image(image: AssetImage("assets/PRI.png"), width: 75, height: 75),
    "PRD": Image(image: AssetImage("assets/PRD.png"),width: 75, height: 75),
    "MORENA": Image(image: AssetImage("assets/MORENA.png"), width: 75, height: 75)
  };

  static Map<String, Color> colors = {
    "PAN": Color.fromARGB(255, 23, 0, 170),
    "PRI": Color.fromARGB(255, 0, 138, 18),
    "PRD": Color.fromARGB(255, 200, 184, 6),
    "MORENA": Color.fromARGB(255, 151, 18, 58)
  };

  static Map<String, Row> winner = {
    "PRI2012": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Enrique Peña Nieto", style: TextStyle(fontSize: 18),), SizedBox(width: 10,),
                          Image(image: AssetImage("assets/peña.jpg"), height: 120,)],)
  };

}