// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

  static TextStyle styleCandidate = TextStyle(fontSize: 15, fontWeight: FontWeight.w700);


  static Map<String, Row> winner = {
    "PRI1994": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Ernesto Zedillo", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/zedillo.jpg"), height: 120,)],),
    "PRI2000": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Francisco Labastida", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/labastida.png"), height: 120,)],),
    "PRI2006": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Roberto Madrazo Pintado", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/madrazi.jpg"), height: 120,)],),
    "PRI2012": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Enrique Peña Nieto", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/peña.jpg"), height: 120,)],),     
    "PRI2018": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("José Antonio Meade", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/meade.jpg"), height: 120,)],),
    "PAN1994": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Diego Fernández de Cevallos", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/cevallos.jpg"), height: 120,)],),
    "PAN2000": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Vicente Fox", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/fox.jpg"), height: 120,)],),
    "PAN2006": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Felipe Calderón", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/calderon.jpg"), height: 120,)],),  
    "PAN2012": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Josefina Vázquez", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/vazquez.jpg"), height: 120,)],),
    "PAN2018": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Ricardo Anaya", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/anaya.jpg"), height: 120,)],),
    "PRD1994": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Cuauhtémoc Cárdenas", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/cardenas.jpg"), height: 120,)],),
    "PRD2000": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Cuauhtémoc Cárdenas", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/cardenas.jpg"), height: 120,)],),
    "PRD2006": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Andrés Manual López Obrador", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/amlo0.jpg"), height: 120,)],),
    "PRD2012": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Andrés Manual López Obrador", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/amlo0.jpg"), height: 120,)],),
    "MORENA2018": Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Andrés Manual López Obrador", style: styleCandidate), SizedBox(width: 20,),
                          Image(image: AssetImage("assets/amlo1.jpg"), height: 120,)],),                      
  };

}