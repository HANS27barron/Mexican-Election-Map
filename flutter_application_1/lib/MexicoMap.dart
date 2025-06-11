import 'package:flutter/material.dart';
import "package:countries_world_map/countries_world_map.dart";
import 'package:flutter_application_1/DataExtraction.dart';
import 'package:flutter_application_1/PartyData.dart';

class MexicoMap extends StatefulWidget {

  final ValueNotifier<String> selectedState;
  final ValueNotifier<String> year;


  const MexicoMap({required this.selectedState, required this.year});

  @override
  State<MexicoMap> createState() => _MexicoMapState();
}

class _MexicoMapState extends State<MexicoMap> {

  String? tappedState;
  Map<String, Color> stateColors = {};
  Map<String, Map<String, int>>? results;
  late Color aguascalientes;
  late Color bajaCalifornia;
  late Color bajaCaliforniaSur;
  late Color campeche;
  late Color chiapas;
  late Color chihuahua;
  late Color df;
  late Color coahuila;
  late Color colima;
  late Color durango;
  late Color guanajuato;
  late Color guerrero;
  late Color hidalgo;
  late Color jalisco;
  late Color mexico;
  late Color michoacan;
  late Color morelos;
  late Color nayarit;
  late Color nuevoLeon;
  late Color oaxaca;
  late Color puebla;
  late Color queretaro;
  late Color quintanaRoo;
  late Color sanLuisPotosi;
  late Color sinaloa;
  late Color sonora;
  late Color tabasco;
  late Color tamaulipas;
  late Color tlaxcala;
  late Color veracruz;
  late Color yucatan;
  late Color zacatecas;


  @override
  void initState() {
    super.initState();
    _loadResults();
    widget.year.addListener(_loadResults);
  }

    Future<void> _loadResults() async {
    final data = await dataExtraction(year: widget.year, selectedState: widget.selectedState).getResults();

    final colors = <String, Color>{};
    final stateParty = <String, String>{};

    data.forEach((stateName, votes) {
      final sortedVotes = votes.entries.toList()
      ..sort((MapEntry<String, int> a, MapEntry<String, int> b) => b.value.compareTo(a.value));     

      final topParty = sortedVotes.first.key;
      final stateCode = PartyData.states[stateName];
      stateParty[stateName]=topParty;
      
      if (stateCode != null) {
        colors[stateCode] = PartyData.colors[topParty] ?? Colors.grey;
      }
    });
    print(stateParty);

    setState(() {
      colors["Aguascalientes"] = Colors.red;
      aguascalientes = PartyData.colors[stateParty["Aguascalientes"]] ?? Color.fromARGB(255, 255, 255, 255);
      bajaCalifornia = PartyData.colors[stateParty["Baja California"]] ?? Color.fromARGB(255, 255, 255, 255);
      bajaCaliforniaSur = PartyData.colors[stateParty["Baja California Sur"]] ?? Color.fromARGB(255, 255, 255, 255);
      campeche = PartyData.colors[stateParty["Campeche"]] ?? Color.fromARGB(255, 255, 255, 255);
      chiapas = PartyData.colors[stateParty["Chiapas"]] ?? Color.fromARGB(255, 255, 255, 255);
      chihuahua = PartyData.colors[stateParty["Chihuahua"]] ?? Color.fromARGB(255, 255, 255, 255);
      df = PartyData.colors[stateParty["Distrito Federal"]] ?? Color.fromARGB(255, 255, 255, 255);
      coahuila = PartyData.colors[stateParty["Coahuila"]] ?? Color.fromARGB(255, 255, 255, 255);
      colima = PartyData.colors[stateParty["Colima"]] ?? Color.fromARGB(255, 255, 255, 255);
      durango = PartyData.colors[stateParty["Durango"]] ?? Color.fromARGB(255, 255, 255, 255);
      guanajuato = PartyData.colors[stateParty["Guanajuato"]] ?? Color.fromARGB(255, 255, 255, 255);
      guerrero = PartyData.colors[stateParty["Guerrero"]] ?? Color.fromARGB(255, 255, 255, 255);
      hidalgo = PartyData.colors[stateParty["Hidalgo"]] ?? Color.fromARGB(255, 255, 255, 255);
      jalisco = PartyData.colors[stateParty["Jalisco"]] ?? Color.fromARGB(255, 255, 255, 255);
      mexico = PartyData.colors[stateParty["México"]] ?? Color.fromARGB(255, 255, 255, 255);
      michoacan = PartyData.colors[stateParty["Michoacán"]] ?? Color.fromARGB(255, 255, 255, 255);
      morelos = PartyData.colors[stateParty["Morelos"]] ?? Color.fromARGB(255, 255, 255, 255);
      nayarit = PartyData.colors[stateParty["Nayarit"]] ?? Color.fromARGB(255, 255, 255, 255);
      nuevoLeon = PartyData.colors[stateParty["Nuevo León"]] ?? Color.fromARGB(255, 255, 255, 255);
      oaxaca = PartyData.colors[stateParty["Oaxaca"]] ?? Color.fromARGB(255, 255, 255, 255);
      puebla = PartyData.colors[stateParty["Puebla"]] ?? Color.fromARGB(255, 255, 255, 255);
      queretaro = PartyData.colors[stateParty["Querétaro"]] ?? Color.fromARGB(255, 255, 255, 255);
      quintanaRoo = PartyData.colors[stateParty["Quintana Roo"]] ?? Color.fromARGB(255, 255, 255, 255);
      sanLuisPotosi = PartyData.colors[stateParty["San Luis Potosí"]] ?? Color.fromARGB(255, 255, 255, 255);
      sinaloa = PartyData.colors[stateParty["Sinaloa"]] ?? Color.fromARGB(255, 255, 255, 255);
      sonora = PartyData.colors[stateParty["Sonora"]] ?? Color.fromARGB(255, 255, 255, 255);
      tabasco = PartyData.colors[stateParty["Tabasco"]] ?? Color.fromARGB(255, 255, 255, 255);
      tamaulipas = PartyData.colors[stateParty["Tamaulipas"]] ?? Color.fromARGB(255, 255, 255, 255);
      tlaxcala = PartyData.colors[stateParty["Tlaxcala"]] ?? Color.fromARGB(255, 255, 255, 255);
      veracruz = PartyData.colors[stateParty["Veracruz"]] ?? Color.fromARGB(255, 255, 255, 255);
      yucatan = PartyData.colors[stateParty["Yucatán"]] ?? Color.fromARGB(255, 255, 255, 255);
      zacatecas = PartyData.colors[stateParty["Zacatecas"]] ?? Color.fromARGB(255, 255, 255, 255);
      results = data;
      stateColors = ({"mxCOL": Colors.amber});
    });
  }

  @override
   Widget build(BuildContext context) {
    if (results == null) {
      return SimpleMap(
      instructions: SMapMexico.instructions,
      countryBorder: CountryBorder(color: Colors.black),
      defaultColor: const Color.fromARGB(255, 228, 223, 223),
      colors: SMapMexicoColors().toMap(),);
    }
    return SimpleMap(
      key: ValueKey(stateColors.hashCode),  // <--- FORCE rebuild
      instructions: SMapMexico.instructions,
      countryBorder: CountryBorder(color: Colors.black),
      defaultColor: Color.fromRGBO(228, 223, 223, 1),
      colors: SMapMexicoColors(
          mxAGU: aguascalientes,
          mxBCN: bajaCalifornia,
          mxBCS: bajaCaliforniaSur,
          mxCAM: campeche,
          mxCHP: chiapas,
          mxCHH: chihuahua,
          mxDIF: df,
          mxCOA: coahuila,
          mxCOL: colima,
          mxDUR: durango,
          mxGUA: guanajuato,
          mxGRO: guerrero,
          mxHID: hidalgo,
          mxJAL: jalisco,
          mxMEX: mexico,
          mxMIC: michoacan,
          mxMOR: morelos,
          mxNAY: nayarit,
          mxNEL: nuevoLeon,
          mxOAX: oaxaca,
          mxPUE: puebla,
          mxQUE: queretaro,
          mxROO: quintanaRoo,
          mxSLP: sanLuisPotosi,
          mxSIN: sinaloa,
          mxSON: sonora,
          mxTAB: tabasco,
          mxTAM: tamaulipas,
          mxTLA: tlaxcala,
          mxVER: veracruz,
          mxYUC: yucatan,
          mxZAC: zacatecas,
          ).toMap(),
      callback: (id, name, tapDetails) {
        print(stateColors);
        setState(() {
          if (tappedState == id) {
            tappedState = null;
          } else {
            tappedState = id;
            widget.selectedState.value = name;
          }
        });
      },
      onHover: (id, name, tapDetails) {
        if (tappedState == null) {
          widget.selectedState.value = name;
        }
      },
    );
  }
}