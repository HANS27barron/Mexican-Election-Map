import 'package:countries_world_map/components/canvas/shape_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Year.dart';
import 'package:url_launcher/url_launcher.dart';



class mexAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Color color;
  
  mexAppBar({
    this.title="Mapa Electoral Mexicano",
    this.color= const Color.fromARGB(255, 7, 111, 26)
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
        AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: Color.fromARGB(255, 98, 98, 98),
                    title: Text("Referencias", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),), 
                    content: Container(height: 90, child: Column(children: [
                      Text("Los datos de esta aplicación fueron obtenidos a través del Sistema de Consulta de la Estadística de las Elecciones."),  
                      Text("Instituto Nacional Electoral, 2025."),
                      TextButton(onPressed: _launchUrl, child: Text("Presione para ir al sitio", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 214, 181, 223)),))
                    ]))));
    
    return AppBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),   
      title: Text(title, style: 
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w600, letterSpacing: 1.5),
                        ),
      backgroundColor: color,
      actions: [Container(child: Padding(padding: EdgeInsets.only(right: 6), child: Text("Año Electoral:", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),),),
        Container(child: Padding(padding: EdgeInsets.only(right: 450), child: DropdownButtonExample())),
        TextButton.icon(onPressed: ()=> openDialog(), label: Text("Referencias", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),), icon: Icon(Icons.question_mark_rounded, color: Colors.white,)),
        SizedBox(width: 20,)], 
    );
    
  

  }

    Size get preferredSize => Size.fromHeight(kToolbarHeight);



}