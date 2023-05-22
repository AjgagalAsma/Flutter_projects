import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/favorite_product_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Product> favoriteProducts;

  const FavoritesScreen(this.favoriteProducts);

  @override
  Widget build(BuildContext context) {
    if (favoriteProducts.isEmpty) {
      return Center(
        child: Text("no product here"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return FavoriteProductItem(
            id: favoriteProducts[index].id,
            title: favoriteProducts[index].title,
            imageUrl: favoriteProducts[index].imageUrl,
            description: favoriteProducts[index].description,
            prix: favoriteProducts[index].prix,
            productType: favoriteProducts[index].productType,
          );
        },
        itemCount: favoriteProducts.length,
      );
    }
  }
}
