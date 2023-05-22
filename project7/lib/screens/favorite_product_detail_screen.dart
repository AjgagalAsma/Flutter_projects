import 'package:flutter/material.dart';
import '../models/product.dart';
import './categories_screen.dart';
import '../app_data.dart';

class FavoriteProductDetailScreen extends StatelessWidget {
  static const screenRoute = "/favorite_screen_products_detail";

  final Function manageFavorite;
  FavoriteProductDetailScreen(this.manageFavorite);

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ProductId = ModalRoute.of(context)!.settings.arguments as String;

    final selectProduct =
        Products_data.firstWhere((Product) => Product.id == ProductId);
    return Scaffold(
      backgroundColor: Colors.cyan[600],
      appBar: app_bar(context),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: size.width * 0.8,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(selectProduct.imageUrl),
                    radius: size.width *
                        0.9, // Set the radius to half of the container's height
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    selectProduct.title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.amber,
                    child: Text(
                      "Le prix : ${selectProduct.prix}\$",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          showDescription(selectProduct.description),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star, color: Colors.black),
        onPressed: () {
          manageFavorite(ProductId);
          Navigator.of(context).pushNamed("/");
        },
        backgroundColor: Colors.amber,
      ),
    );
  }
}

AppBar app_bar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.grey[100],
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.cyan[600],
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}

Container showDescription(String Des) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Text(
      Des,
      style: TextStyle(color: Colors.white, fontSize: 19.0),
    ),
  );
}
