import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Serphp",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Day 1"),
        ),
        body: Center(
          key: key,
          child: Text(
            "Hola Mundo"
          ),
        ),
      ),
    );
  }
}