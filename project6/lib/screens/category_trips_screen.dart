import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryTripsScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final filter_trip = Trips_data.where((trip) {
      return trip.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
              id: filter_trip[index].id,
              title: filter_trip[index].title,
              imageUrl: filter_trip[index].imageUrl,
              duration: filter_trip[index].duration,
              season: filter_trip[index].season,
              tripType: filter_trip[index].tripType);
        },
        itemCount: filter_trip.length,
      ),
    );
  }
}
