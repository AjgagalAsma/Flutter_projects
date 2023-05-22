import 'package:flutter/material.dart';
// import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ListTile listTitleMethode(
      BuildContext context, String title, IconData icon, VoidCallback ontap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Theme.of(context).primaryColor,
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
            color: Colors.amber[300],
            child: Text(
              "Ton guide",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 20),
          listTitleMethode(context, "Les produits", Icons.category, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          // listTitleMethode("الفلترة", Icons.filter_list, () {
          //   Navigator.of(context)
          //       .pushReplacementNamed(FiltersScreen.screenRoute);
          // })
        ],
      ),
    );
  }
}
