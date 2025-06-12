// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Year.dart';
import 'package:url_launcher/url_launcher.dart';



class mexAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Color color;
  final ValueNotifier<String> year;

  const mexAppBar({
    this.title="Mapa Electoral Mexicano",
    this.color= const Color.fromARGB(255, 33, 33, 33),
    required this.year
  });

  Widget build(BuildContext context){

    //REFERENCIAS
    final Uri _ineUrl = Uri.parse("https://siceen21.ine.mx/home");
    
    Future<void> _launchUrl() async {
      if (!await launchUrl(_ineUrl)) {
        throw Exception('Could not launch $_ineUrl');
      }
    }

    openDialog()=> showDialog(context: context, builder: (context)=>
        AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: Color.fromARGB(255, 59, 59, 59),
                    title: Text("Referencias", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),), 
                    content: Container(height: 90, child: Column(children: [
                      Text("Los datos de esta aplicación fueron obtenidos a través del Sistema de Consulta de la Estadística de las Elecciones.", style: TextStyle(color: Colors.white),),  
                      Text("Instituto Nacional Electoral, 2025.", style: TextStyle(color: Colors.white)),
                      TextButton(onPressed: _launchUrl, child: Text("Presione para ir al sitio", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 180, 178, 180)),))
                    ]))));
    
    return 
    PreferredSize(preferredSize: Size.fromHeight(10), child: LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
    return AppBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),   
      title: Text(title, style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w600, letterSpacing: 1.5)),
      backgroundColor: color,
      actions: [Row(children: 
      [Padding(padding: EdgeInsets.only(right: width*0.008), child: Text("Año Electoral:", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),),
        Padding(padding: EdgeInsets.only(right: width*0.29), child: DropdownButtonExample(year: year)),
        Padding(padding: EdgeInsets.only(right: width*0.04), child: TextButton.icon(onPressed: ()=> openDialog(), label: Text("Referencias", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),), icon: Icon(Icons.question_mark_rounded, color: Colors.white,)),
    )])], 
    );
  }));}
    Size get preferredSize => Size.fromHeight(kToolbarHeight);

}