import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';
import '../screens/category_trips_screen.dart';

class categoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 5),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 8 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      children: Categories_data.map((e) =>
              categoryItem(id: e.id, title: e.title, imageUrl: e.imageUrl))
          .toList(),
    );
  }
}
