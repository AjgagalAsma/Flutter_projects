import 'package:flutter/material.dart';
import '../screens/category_products_screen.dart';

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
    Navigator.of(ctx).pushNamed(CategoryProductsScreen.screenRoute, arguments: {
      "id": id,
      "title": title,
      "imageUrl": imageUrl,
    });
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
            child: Image(
              image: AssetImage(imageUrl),
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ],
      ),
    );
  }
}
