import 'package:countries_world_map/components/canvas/shape_handler.dart';
import 'package:flutter/material.dart';

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
                        TextStyle(color: Color.fromARGB(255, 30, 30, 30), fontWeight: FontWeight.w600),
                        ),
      backgroundColor: color,
    );
  }

    Size get preferredSize => Size.fromHeight(kToolbarHeight);


}