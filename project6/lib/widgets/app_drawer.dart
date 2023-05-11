import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(
              Icons.card_travel,
              size: 30,
              color: Colors.blue,
            ),
            title: Text(
              "التصنيفات",
            ),
          )
        ],
      ),
    );
  }
}
