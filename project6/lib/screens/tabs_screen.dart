import 'package:flutter/material.dart';
import 'package:project6/screens/categories_screen.dart';
import 'package:project6/screens/favorites_screen.dart';
import 'package:project6/widgets/app_drawer.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;

  const TabsScreen({super.key, required this.favoriteTrips});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens = [];

  @override
  void initState() {
    _screens = [
      {
        'Screen': categoriesScreen(),
        'Title': 'التصنيفات',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': 'المفضلة',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(_screens[_selectedScreenIndex]['Title'] as String)),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'المفضلة',
          )
        ],
      ),
    );
  }
}
