import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Game 1"),
      ),
      body: my_app(),
    ),
  ));
}

class my_app extends StatefulWidget {
  const my_app({super.key});

  @override
  State<my_app> createState() => _my_appState();
}

class _my_appState extends State<my_app> {
  int leftN = 1;
  int rightN = 1;

  void imgChange() {
    leftN = Random().nextInt(5) + 1;
    rightN = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftN == rightN ? 'مبروك لقد نجحت' : 'حاول مرة أخرى',
          style: TextStyle(
            color: Colors.white,
            fontSize: 42,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      imgChange();
                    });
                  },
                  child: Image.asset('images/$leftN.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      imgChange();
                    });
                  },
                  child: Image.asset('images/$rightN.png'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
