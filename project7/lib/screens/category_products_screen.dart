import 'package:flutter/material.dart';
import 'package:project7/widgets/Product_item.dart';
import '../models/product.dart';

class CategoryProductsScreen extends StatefulWidget {
  static const screenRoute = "/category_Products";

  final List<Product> availableProducts;
  const CategoryProductsScreen(this.availableProducts);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  String categoryTitle = "";
  List<Product> filterProduct = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryId = routeArgument["id"];
    categoryTitle = routeArgument["title"] as String;
    filterProduct = widget.availableProducts.where((Product) {
      return Product.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String value) {
    setState(() {
      filterProduct.removeWhere((element) => element.id == value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ProductItem(
            id: filterProduct[index].id,
            title: filterProduct[index].title,
            imageUrl: filterProduct[index].imageUrl,
            description: filterProduct[index].description,
            prix: filterProduct[index].prix,
            productType: filterProduct[index].productType,
            // removeItem: removeItem,
          );
        },
        itemCount: filterProduct.length,
      ),
    );
  }
}
