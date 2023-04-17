import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("gagag")),
          backgroundColor: Color(0xFF3C7AFF),
        ),
        backgroundColor: Color.fromARGB(255, 199, 196, 196),
        body: Center(
          child: Image(
            image: AssetImage("images/img1.png"),
          ),
        ),
      ),
    ),
  );
}
