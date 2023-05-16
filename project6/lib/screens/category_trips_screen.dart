import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryTripsScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  List<Trip> filterTrip = [];
  @override
  void initState() {
    filterTrip = Trips_data.where((trip) {
      return trip.categories.contains(widget.id);
    }).toList();
    // TODO: implement initState
    super.initState();
  }

  void removeItem(String value) {
    setState(() {
      filterTrip.removeWhere((element) => element.id == value);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: filterTrip[index].id,
            title: filterTrip[index].title,
            imageUrl: filterTrip[index].imageUrl,
            duration: filterTrip[index].duration,
            season: filterTrip[index].season,
            tripType: filterTrip[index].tripType,
            removeItem: removeItem,
          );
        },
        itemCount: filterTrip.length,
      ),
    );
  }
}
