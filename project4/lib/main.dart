import 'package:flutter/material.dart';

void main() {
  runApp(const MusicWidget());
}

class MusicWidget extends StatelessWidget {
  const MusicWidget({super.key});
  Expanded myButton(Color color, String music) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Icon(
                  Icons.music_note_outlined,
                  color: color,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                music,
                style: TextStyle(fontSize: 28, color: color),
              ),
            ],
          ),
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber[200],
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("نغمات"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myButton(Colors.green, "music1"),
            myButton(Colors.pink, "music2"),
            myButton(Colors.lightBlue, "music3"),
            myButton(Colors.redAccent, "music4"),
            myButton(Colors.purple, "music5"),
          ],
        ),
      ),
    );
  }
}
