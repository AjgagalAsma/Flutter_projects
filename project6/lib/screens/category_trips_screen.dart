import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text("قائمة رحلات")),
    );
  }
}
