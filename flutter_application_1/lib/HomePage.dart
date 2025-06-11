import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppBar.dart';
import 'package:flutter_application_1/WidgetOrg.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<String> selectedState = ValueNotifier("");
  final ValueNotifier<String> year = ValueNotifier("");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mexAppBar(year: year,),
      body: WidgetOrg(selectedState: selectedState, year: year), 
      backgroundColor: Color.fromARGB(255, 19, 24, 36)
    );
  }
}
