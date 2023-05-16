import 'package:flutter/material.dart';
import 'package:project6/screens/filters_screen.dart';
import 'package:project6/screens/tabs_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ListTile listTitleMethode(String title, IconData icon, VoidCallback ontap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: ontap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 20),
          listTitleMethode("الرحلات", Icons.card_travel, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const TabsScreen()),
              ),
            );
          }),
          listTitleMethode("الفلترة", Icons.filter_list, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const FiltersScreen()),
              ),
            );
          })
        ],
      ),
    );
  }
}
