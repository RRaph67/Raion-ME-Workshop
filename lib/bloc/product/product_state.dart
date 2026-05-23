import '../../models/product_model.dart';

/// Base class semua state produk.
abstract class ProductState {
  const ProductState();
}

/// State awal sebelum ada event apapun.
class ProductInitial extends ProductState {
  const ProductInitial();
}

/// Sedang memuat data — tampilkan shimmer/loading indicator.
class ProductLoading extends ProductState {
  const ProductLoading();
}

/// Data produk berhasil dimuat.
class ProductLoaded extends ProductState {
  final List<Product> products;

  /// Kategori yang sedang aktif sebagai filter, null = semua kategori.
  final String? activeCategory;

  const ProductLoaded({
    required this.products,
    this.activeCategory,
  });

  /// Mudah rebuild UI hanya ketika data benar-benar berubah.
  ProductLoaded copyWith({
    List<Product>? products,
    String? activeCategory,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      activeCategory: activeCategory ?? this.activeCategory,
    );
  }
}

/// Detail satu produk berhasil dimuat.
class ProductDetailLoaded extends ProductState {
  final Product product;
  const ProductDetailLoaded(this.product);
}

/// Operasi tambah/update/hapus berhasil.
class ProductActionSuccess extends ProductState {
  final String message;
  const ProductActionSuccess(this.message);
}

/// Terjadi error — tampilkan pesan ke user.
class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
}
