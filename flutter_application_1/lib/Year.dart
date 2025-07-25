// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const List<String> list = ["Seleccione","1994","2000","2006", "2012", "2018"];

class DropdownButtonExample extends StatefulWidget {
  final ValueNotifier<String> year;
  const DropdownButtonExample({super.key, required this.year});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: EdgeInsets.only(left:10, right:10),
      borderRadius: BorderRadius.circular(15),
      focusColor: Color.fromARGB(143, 53, 52, 52),
      iconEnabledColor: Color.fromARGB(255, 151, 151, 151),
      dropdownColor: Color.fromARGB(255, 51, 51, 51),
      value: dropdownValue,
      
      //icon: Icon(Icons.today_rounded, color: Color.fromARGB(255, 255, 255, 255), size: 25),
      elevation: 8,
      style: const TextStyle(letterSpacing: 1.1, fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
      underline: Container(height: 0, color: Color.fromARGB(255, 255, 255, 255)),
      onChanged: (String? value) async {
        setState(() {
          dropdownValue = value!;
          widget.year.value = value;
        });
      },
      items:
          list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, enabled: value != list.first, child: Text(value));
          }).toList(),
    );
  }
}
