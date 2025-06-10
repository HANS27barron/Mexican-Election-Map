import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget{
  final ValueNotifier<String> selectedState;
  final ValueNotifier<String> year;

  const DataWidget({super.key, required this.selectedState, required this.year});


  Widget build(BuildContext context){
    return ValueListenableBuilder(valueListenable: selectedState, builder: (context, state, _){
      return ValueListenableBuilder(valueListenable: year, builder: (context, y, _){
          return Container(width: 500, height: 575, child: 
              Column(children: [Container(width: double.infinity, padding: EdgeInsets.all(10), decoration: BoxDecoration(color: Color.fromARGB(255, 177, 22, 11), borderRadius: BorderRadius.circular(9)),
                child: Text(state, textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),), 
                  SizedBox(height: 15,),
                Expanded(child: Container(child: Text(y), height:double.infinity, width: double.infinity, decoration: BoxDecoration(color: Color.fromARGB(255, 151, 106, 103), borderRadius: BorderRadius.circular(9)),))],),);
  });
    });
    
}
}