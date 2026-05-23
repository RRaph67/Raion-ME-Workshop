import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;

  ProductBloc({ProductRepository? repository})
      : _repository = repository ?? ProductRepositoryImpl(),
        super(const ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchProductDetail>(_onFetchProductDetail);
    on<AddProduct>(_onAddProduct);
    on<UpdateProduct>(_onUpdateProduct);
    on<DeleteProduct>(_onDeleteProduct);
    on<ResetProductState>(_onReset);
  }

  // ── Handler: FetchProducts ──────────────────────────────────
  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      final products = await _repository.fetchProducts(
        category: event.category,
      );
      emit(ProductLoaded(
        products: products,
        activeCategory: event.category,
      ));
    } catch (e) {
      emit(ProductError(_friendlyError(e)));
    }
  }

  // ── Handler: FetchProductDetail ─────────────────────────────
  Future<void> _onFetchProductDetail(
    FetchProductDetail event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      final product = await _repository.fetchProductById(event.id);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductError(_friendlyError(e)));
    }
  }

  // ── Handler: AddProduct ─────────────────────────────────────
  Future<void> _onAddProduct(
    AddProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      await _repository.addProduct(event.product);
      emit(const ProductActionSuccess('Produk berhasil ditambahkan.'));

      // Langsung refresh daftar produk setelah tambah
      add(const FetchProducts());
    } catch (e) {
      emit(ProductError(_friendlyError(e)));
    }
  }

  // ── Handler: UpdateProduct ──────────────────────────────────
  Future<void> _onUpdateProduct(
    UpdateProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      await _repository.updateProduct(event.product);
      emit(const ProductActionSuccess('Produk berhasil diperbarui.'));
      add(const FetchProducts());
    } catch (e) {
      emit(ProductError(_friendlyError(e)));
    }
  }

  // ── Handler: DeleteProduct ──────────────────────────────────
  Future<void> _onDeleteProduct(
    DeleteProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    try {
      await _repository.deleteProduct(event.id);
      emit(const ProductActionSuccess('Produk berhasil dihapus.'));
      add(const FetchProducts());
    } catch (e) {
      emit(ProductError(_friendlyError(e)));
    }
  }

  // ── Handler: ResetProductState ──────────────────────────────
  void _onReset(ResetProductState event, Emitter<ProductState> emit) {
    emit(const ProductInitial());
  }

  // ── Helper ──────────────────────────────────────────────────
  String _friendlyError(Object e) {
    // Sederhanakan pesan error dari exception/network untuk ditampilkan ke user
    final raw = e.toString();
    if (raw.contains('SocketException') || raw.contains('connection')) {
      return 'Tidak ada koneksi internet. Periksa jaringanmu.';
    }
    if (raw.contains('TimeoutException')) {
      return 'Koneksi timeout. Coba lagi.';
    }
    return raw.replaceFirst('Exception: ', '');
  }
}
