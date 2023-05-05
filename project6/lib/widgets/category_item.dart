import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

class categoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const categoryItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (c) => CategoryTripsScreen(
              id: id,
              title: title,
              imageUrl: imageUrl,
            )));
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 258,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ],
      ),
    );
  }
}
