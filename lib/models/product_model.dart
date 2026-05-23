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

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final bool isAvailable;

  // Tambahan dari model lama
  final double rating;
  final int reviewCount;
  final bool isFavorite;
  final String unit;
  final bool isOrganic;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isAvailable = true,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isFavorite = false,
    this.unit = 'kg',
    this.isOrganic = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String,
      category: json['category'] as String,
      isAvailable: json['is_available'] as bool? ?? true,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['review_count'] as int? ?? 0,
      isFavorite: json['is_favorite'] as bool? ?? false,
      unit: json['unit'] as String? ?? 'kg',
      isOrganic: json['is_organic'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'category': category,
      'is_available': isAvailable,
      'rating': rating,
      'review_count': reviewCount,
      'is_favorite': isFavorite,
      'unit': unit,
      'is_organic': isOrganic,
    };
  }
}
