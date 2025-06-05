import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppBar.dart';
import 'package:flutter_application_1/MexicoMap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mexAppBar(),
      body: MexicoMap(),
      backgroundColor: Color.fromARGB(255, 13, 41, 19)
    );
  }
}
