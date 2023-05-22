import 'package:flutter/material.dart';
import './models/category.dart';
import './models/product.dart';

const Categories_data = const [
  Category(id: 'c1', title: 'Bijoux argent', imageUrl: 'images/img1.jpg'),
  Category(id: 'c2', title: 'Tapis traditionnel', imageUrl: 'images/img2.jpg'),
  Category(id: 'c3', title: 'Bois de thuya', imageUrl: 'images/img3.jpg'),
  Category(id: 'c4', title: 'Bougie', imageUrl: 'images/img4.jpg'),
  Category(id: 'c5', title: 'Textile', imageUrl: 'images/img5.jpg'),
  Category(id: 'c6', title: 'Raphia', imageUrl: 'images/img6.jpg'),
  Category(id: 'c7', title: 'Produit végétaux', imageUrl: 'images/img7.jpg'),
  Category(id: 'c8', title: 'Couture', imageUrl: 'images/img8.jpg'),
  Category(id: 'c9', title: 'Cuir', imageUrl: 'images/img9.jpg'),
  Category(id: 'c10', title: 'cosmétique', imageUrl: 'images/img10.jpg'),
];

const Products_data = const [
  Product(
    id: 'p1',
    categories: [
      'c1',
    ],
    title: "Bijou 1",
    imageUrl: 'images/bijou1.jpg',
    description:
        "Bracelet ajustable en argent sous forme de sept alliances. Chacune de ces alliances représente un jour de la semaine et se considère comme porte bonheur.",
    prix: 93,
    productType: ProductType.bijoux,
    isInSummer: false,
    isForFamilies: true,
    isInWinter: true,
  ),
  Product(
    id: 'p2',
    categories: [
      'c1',
    ],
    title: "Bijou 1",
    imageUrl: 'images/bijou1.jpg',
    description:
        "Bracelet ajustable en argent sous forme de sept alliances. Chacune de ces alliances représente un jour de la semaine et se considère comme porte bonheur.",
    prix: 93,
    productType: ProductType.bijoux,
    isInSummer: false,
    isForFamilies: true,
    isInWinter: true,
  ),
];
