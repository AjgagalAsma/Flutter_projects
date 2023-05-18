import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = "/category_trips";

  final List<Trip> availableTrips;
  const CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String categoryTitle = "";
  List<Trip> filterTrip = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryId = routeArgument["id"];
    categoryTitle = routeArgument["title"] as String;
    filterTrip = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String value) {
    setState(() {
      filterTrip.removeWhere((element) => element.id == value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
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
