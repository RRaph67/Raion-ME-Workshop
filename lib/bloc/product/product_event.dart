import '../../models/product_model.dart';

/// Base class semua event produk.
/// Gunakan [abstract] agar setiap event harus didefinisikan eksplisit.
abstract class ProductEvent {
  const ProductEvent();
}

/// Muat semua produk, opsional filter berdasarkan [category].
class FetchProducts extends ProductEvent {
  final String? category;
  const FetchProducts({this.category});
}

/// Muat detail satu produk berdasarkan [id].
class FetchProductDetail extends ProductEvent {
  final String id;
  const FetchProductDetail(this.id);
}

/// Tambah produk baru.
class AddProduct extends ProductEvent {
  final Product product;
  const AddProduct(this.product);
}

/// Update data produk yang sudah ada.
class UpdateProduct extends ProductEvent {
  final Product product;
  const UpdateProduct(this.product);
}

/// Hapus produk berdasarkan [id].
class DeleteProduct extends ProductEvent {
  final String id;
  const DeleteProduct(this.id);
}

/// Reset state ke initial (berguna saat keluar dari halaman).
class ResetProductState extends ProductEvent {
  const ResetProductState();
}
