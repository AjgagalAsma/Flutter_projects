import 'package:flutter/material.dart';
import 'package:project6/screens/categories_screen.dart';
import 'package:project6/screens/favorites_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("دليل سياحي")),
          bottom: TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                text: ("التصنيفات"),
              ),
              Tab(
                icon: Icon(Icons.star),
                text: ('المفضلة'),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            categoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
