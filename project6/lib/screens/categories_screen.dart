import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';
import '../screens/category_trips_screen.dart';

class categoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      children: Categories_data.map((e) =>
              categoryItem(id: e.id, title: e.title, imageUrl: e.imageUrl))
          .toList(),
    );
  }
}
