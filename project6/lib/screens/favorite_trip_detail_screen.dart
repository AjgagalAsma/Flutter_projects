import 'package:flutter/material.dart';
import 'package:project6/models/trip.dart';
import './categories_screen.dart';
import '../app_data.dart';

class FavoriteTripDetailScreen extends StatelessWidget {
  static const screenRoute = "/favorite_screen_trips_detail";

  final Function manageFavorite;
  FavoriteTripDetailScreen(this.manageFavorite);

  Widget BuildSectionTitle(BuildContext cnx, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(cnx).textTheme.headlineSmall,
      ),
    );
  }

  Widget BuildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;

    final selectTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectTrip.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            BuildSectionTitle(context, "الانشطة"),
            BuildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            BuildSectionTitle(context, 'البرنامج اليومي'),
            BuildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.program.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text("يوم ${index + 1}"),
                  ),
                  title: Text(selectTrip.program[index]),
                ),
              ),
            ),
          ],
        ),
      ),
      // no problem
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: () {
          manageFavorite(tripId);
          Navigator.of(context).pushNamed("/");
        },
        backgroundColor: Colors.amber,
      ),
    );
  }
}
