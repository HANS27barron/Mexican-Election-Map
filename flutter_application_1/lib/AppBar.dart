import 'package:countries_world_map/components/canvas/shape_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Year.dart';

class mexAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Color color;
  
  mexAppBar({
    this.title="Mapa Electoral Mexicano",
    this.color= const Color.fromARGB(255, 7, 111, 26)
  });

  Widget build(BuildContext context){
    return AppBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),   
      title: Text(title, style: 
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w600, letterSpacing: 1.5),
                        ),
      backgroundColor: color,
      actions: [Container(child: Padding(padding: EdgeInsets.only(right: 6), child: Text("Año Electoral:", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),),),
        Container(child: Padding(padding: EdgeInsets.only(right: 100), child: DropdownButtonExample()))], 
    );
  }

    Size get preferredSize => Size.fromHeight(kToolbarHeight);


}