import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';
// import '../screens/Product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final double prix;
  final ProductType productType;

  // final ProductType ProductType;
  // final Function(String) removeItem;

  const ProductItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.prix,
    required this.productType,
    // required this.ProductType,
    // required this.removeItem,
  });

  String get Product_type {
    if (productType == ProductType.bijoux) return "Bijoux argent";
    if (productType == ProductType.tapis) return "Tapis traditionnel";
    if (productType == ProductType.bois) return "Bois de thuya";
    if (productType == ProductType.Bougie) return "Bougie";
    if (productType == ProductType.Textile) return "Textile";
    if (productType == ProductType.raphia) return "Raphia";
    if (productType == ProductType.vegetaux) return "Produit végétaux";
    if (productType == ProductType.couture) return "Couture";
    if (productType == ProductType.Cuir) return "Cuir";
    if (productType == ProductType.cosmetique)
      return "Cosmétique";
    else
      return "inconnu";
  }

  // no problem
  void selectProduct(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(ProductDetailScreen.screenRoute, arguments: id)
        .then((value) {
      // if (value != null) removeItem(value as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectProduct(context),
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
                  child: Image(
                    image: AssetImage(imageUrl),
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
                      Icon(Icons.money, color: Colors.amber),
                      SizedBox(width: 6),
                      Text('$prix €'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.type_specimen_outlined, color: Colors.amber),
                      SizedBox(width: 6),
                      Text(Product_type),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Icon(Icons.family_restroom, color: Colors.amber),
                  //     SizedBox(width: 6),
                  //     Text(ProductText),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
