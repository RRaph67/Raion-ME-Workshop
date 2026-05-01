// lib/models/product_model.dart

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final String category;
  final bool isFavorite;
  final String unit;
  final bool isOrganic;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.category,
    this.isFavorite = false,
    this.unit = 'kg',
    this.isOrganic = false,
  });

  Product copyWith({bool? isFavorite}) {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      rating: rating,
      reviewCount: reviewCount,
      imageUrl: imageUrl,
      category: category,
      isFavorite: isFavorite ?? this.isFavorite,
      unit: unit,
      isOrganic: isOrganic,
    );
  }
}

class Category {
  final String id;
  final String name;
  final String imageUrl;
  final String color;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.color,
  });
}

class Banner {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String backgroundColor;
  final String buttonText;

  const Banner({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.backgroundColor,
    required this.buttonText,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
