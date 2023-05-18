import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;
  final Function(String) removeItem;

  const TripItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.removeItem,
  });

  String get seasonText {
    if (season == Season.Winter) return "شتاء";
    if (season == Season.Summer) return "صيف";
    if (season == Season.Autumn) return "خريف";
    if (season == Season.Spring)
      return "ربيع";
    else
      return 'غير معروف';
  }

  String get tripText {
    if (tripType == TripType.Exploration) return "استكشاف";
    if (tripType == TripType.Recovery) return "نقاهة";
    if (tripType == TripType.Activities) return "انشطة";
    if (tripType == TripType.Therapi)
      return "معالجة";
    else
      return 'غير معروف';
  }

  // no problem
  void selectTrip(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(TripDetailScreen.screenRoute, arguments: id)
        .then((value) {
      if (value != null) removeItem(value as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today, color: Colors.amber),
                      SizedBox(width: 6),
                      Text('$duration ايام'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.sunny, color: Colors.amber),
                      SizedBox(width: 6),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.family_restroom, color: Colors.amber),
                      SizedBox(width: 6),
                      Text(tripText),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
