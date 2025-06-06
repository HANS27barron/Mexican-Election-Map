import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget{
  DataWidget();
  Widget build(BuildContext context){
    return Container(width: 500,height: 575, child: 
            Column(children: [Container(color: Colors.redAccent, width: double.infinity, height: 30, child: Text("Estado"),)],),);
  }
}