enum Season {
  Winter,
  Spring,
  Summer,
  Autumn,
}

enum ProductType {
  bijoux,
  tapis,
  bois,
  vegetaux,
  raphia,
  couture,
  cosmetique,
  Cuir,
  Bougie,
  Textile,
}

class Product {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final String description;
  final double prix;
  final ProductType productType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  const Product(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.prix,
      required this.productType,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
