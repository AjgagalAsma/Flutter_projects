import 'package:flutter/material.dart';
import 'package:project6/app_data.dart';
import 'package:project6/screens/categories_screen.dart';
import 'package:project6/screens/category_trips_screen.dart';
import 'package:project6/screens/filters_screen.dart';
import 'package:project6/screens/tabs_screen.dart';
import 'package:project6/screens/trip_detail_screen.dart';
import './models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "family": false,
  };

  List<Trip> _availableTrips = Trips_data;

  void _changeFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters["summer"] == true && trip.isInSummer != true) return false;
        if (_filters["winter"] == true && trip.isInWinter != true) return false;
        if (_filters["family"] == true && trip.isForFamilies != true)
          return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel app',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              headlineMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold))),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
