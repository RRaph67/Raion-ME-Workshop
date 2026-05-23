import '../models/product_model.dart';

/// Abstract contract — swap implementasi (API, local, mock) tanpa ubah BLoC.
abstract class ProductRepository {
  Future<List<Product>> fetchProducts({String? category});
  Future<Product> fetchProductById(String id);
  Future<Product> addProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}

/// Implementasi dummy/mock — ganti dengan HTTP atau Supabase sesuai kebutuhan.
class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts({String? category}) async {
    // Simulasi network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // TODO: Ganti dengan pemanggilan API nyata
    // Contoh: final response = await http.get(Uri.parse('$baseUrl/products'));
    final dummy = [
      Product(
        id: '1',
        name: 'Kopi Susu Gula Aren',
        description: 'Perpaduan espresso, susu segar, dan gula aren asli.',
        price: 22000,
        imageUrl: 'assets/images/kopi_susu.jpg',
        category: 'Kopi',
      ),
      Product(
        id: '2',
        name: 'Matcha Latte',
        description: 'Matcha premium grade dari Jepang, creamy dan harum.',
        price: 25000,
        imageUrl: 'assets/images/matcha.jpg',
        category: 'Non-Kopi',
      ),
      Product(
        id: '3',
        name: 'Croissant Butter',
        description: 'Renyah di luar, lembut di dalam.',
        price: 18000,
        imageUrl: 'assets/images/croissant.jpg',
        category: 'Makanan',
      ),
    ];

    if (category != null && category.isNotEmpty) {
      return dummy.where((p) => p.category == category).toList();
    }
    return dummy;
  }

  @override
  Future<Product> fetchProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final all = await fetchProducts();
    return all.firstWhere(
      (p) => p.id == id,
      orElse: () => throw Exception('Produk dengan id $id tidak ditemukan.'),
    );
  }

  @override
  Future<Product> addProduct(Product product) async {
    await Future.delayed(const Duration(milliseconds: 600));
    // TODO: POST ke API
    return product;
  }

  @override
  Future<Product> updateProduct(Product product) async {
    await Future.delayed(const Duration(milliseconds: 600));
    // TODO: PUT ke API
    return product;
  }

  @override
  Future<void> deleteProduct(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // TODO: DELETE ke API
  }
}
