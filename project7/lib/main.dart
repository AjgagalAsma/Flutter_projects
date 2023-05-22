import 'package:flutter/material.dart';
import '../app_data.dart';
import '../screens/categories_screen.dart';
import '../screens/category_products_screen.dart';
// import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/product_detail_screen.dart';
import './screens/favorite_product_detail_screen.dart';
import './models/product.dart';

MaterialColor customColor = MaterialColor(
  0xFF059DC0,
  <int, Color>{
    50: Color(0xFFE2F4F8),
    100: Color(0xFFB5E4F0),
    200: Color(0xFF87D3E7),
    300: Color(0xFF59C2DF),
    400: Color(0xFF2BB2D7),
    500: Color(0xFF059DC0),
    600: Color(0xFF0489A8),
    700: Color(0xFF037590),
    800: Color(0xFF026278),
    900: Color(0xFF015960),
  },
);
Color customColorShade = customColor.shade200;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "family": false,
  };

  List<Product> _availableProducts = Products_data;
  List<Product> _favoriteProducts = [];

  // void _changeFilters(Map<String, bool> filtersData) {
  //   setState(() {
  //     _filters = filtersData;

  //     _availableProducts = Products_data.where((Product) {
  //       if (_filters["summer"] == true && Product.isInSummer != true) return false;
  //       if (_filters["winter"] == true && Product.isInWinter != true) return false;
  //       if (_filters["family"] == true && Product.isForFamilies != true)
  //         return false;
  //       return true;
  //     }).toList();
  //   });
  // }

  void _manageFavorite(String ProductId) {
    final existingIndex =
        _favoriteProducts.indexWhere((Product) => Product.id == ProductId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteProducts.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteProducts.add(
          Products_data.firstWhere((Product) => Product.id == ProductId),
        );
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteProducts.any((Product) => Product.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel app',
      theme: ThemeData(
          primarySwatch: customColor,
          textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall: TextStyle(
                  color: Color(0xFFA47551),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              headlineMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold))),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(favoriteProducts: _favoriteProducts),
        CategoryProductsScreen.screenRoute: (ctx) =>
            CategoryProductsScreen(_availableProducts),
        ProductDetailScreen.screenRoute: (ctx) =>
            ProductDetailScreen(_manageFavorite, _isFavorite),
        FavoriteProductDetailScreen.screenRoute: (ctx) =>
            FavoriteProductDetailScreen(_manageFavorite),
        // FiltersScreen.screenRoute: (ctx) =>
        //     FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
