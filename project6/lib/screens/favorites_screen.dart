import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/favorite_trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;

  const FavoritesScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(
        child: Text("no product here"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return FavoriteTripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            season: favoriteTrips[index].season,
            tripType: favoriteTrips[index].tripType,
            // removeItem: removeItem,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
