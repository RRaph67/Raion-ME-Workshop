// lib/providers/app_provider.dart
import 'package:flutter/foundation.dart';
import '../models/product_model.dart';
import '../utils/app_data.dart';

class AppProvider extends ChangeNotifier {
  // Navigation
  int _currentNavIndex = 0;
  int get currentNavIndex => _currentNavIndex;

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  // Search
  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  void updateSearch(String query) {
    _searchQuery = query;
    _isSearching = query.isNotEmpty;
    notifyListeners();
  }

  // Category Filter
  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // Products
  List<Product> get allProducts => AppData.products;
  List<Product> get flashSaleProducts => AppData.flashSaleProducts;

  List<Product> get filteredProducts {
    var products = allProducts;
    if (_selectedCategory != 'All') {
      products = products.where((p) => p.category == _selectedCategory).toList();
    }
    if (_searchQuery.isNotEmpty) {
      products = products
          .where((p) =>
              p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              p.description.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
    return products;
  }

  List<Product> get searchResults {
    if (_searchQuery.isEmpty) return [];
    return allProducts
        .where((p) =>
            p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            p.description.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  // Favorites
  final Set<String> _favoriteIds = {};

  bool isFavorite(String productId) => _favoriteIds.contains(productId);

  void toggleFavorite(String productId) {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    notifyListeners();
  }

  List<Product> get favoriteProducts =>
      allProducts.where((p) => _favoriteIds.contains(p.id)).toList();

  // Cart
  final List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  int get cartCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get cartTotal =>
      _cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  void addToCart(Product product) {
    final existing = _cartItems.where((i) => i.product.id == product.id);
    if (existing.isNotEmpty) {
      existing.first.quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cartItems.removeWhere((i) => i.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    final item = _cartItems.firstWhere((i) => i.product.id == productId);
    if (quantity <= 0) {
      removeFromCart(productId);
    } else {
      item.quantity = quantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  int getCartQuantity(String productId) {
    final items = _cartItems.where((i) => i.product.id == productId);
    return items.isNotEmpty ? items.first.quantity : 0;
  }

  // Carousel Index
  int _carouselIndex = 0;
  int get carouselIndex => _carouselIndex;

  void setCarouselIndex(int index) {
    _carouselIndex = index;
    notifyListeners();
  }
}
