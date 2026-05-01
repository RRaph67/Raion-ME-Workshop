// lib/providers/app_provider.dart
import 'package:flutter/foundation.dart';
import '../utils/app_data.dart';
import '../models/product_model.dart';

class AppProvider extends ChangeNotifier {
  // Navigation
  int _currentNavIndex = 0;
  int get currentNavIndex => _currentNavIndex;

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  // Products (langsung ambil dari AppData)
  List<Product> get allProducts => AppData.products;
  List<Product> get flashSaleProducts => AppData.flashSaleProducts;

  // Carousel Index
  int _carouselIndex = 0;
  int get carouselIndex => _carouselIndex;

  void setCarouselIndex(int index) {
    _carouselIndex = index;
    notifyListeners();
  }
}
