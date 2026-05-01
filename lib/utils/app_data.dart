// lib/utils/app_data.dart
import '../models/product_model.dart';

class AppData {
  static List<Banner> get banners => [
        const Banner(
          id: '1',
          title: 'Apakah Kamu Seorang Petani?',
          subtitle: 'Ayo Jual produkmu',
          imageUrl:
              'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?w=400',
          backgroundColor: '#E8F5E9',
          buttonText: 'Mulai Jual',
        ),
        const Banner(
          id: '2',
          title: 'Sayuran Organik\nSegar',
          subtitle: 'Diantar langsung\nke rumahmu',
          imageUrl:
              'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400',
          backgroundColor: '#FFF8E1',
          buttonText: 'Belanja Sekarang',
        ),
        const Banner(
          id: '3',
          title: 'Diskon Musim Panas 30% Off',
          subtitle: 'Untuk semua buah\nsegar hari ini',
          imageUrl:
              'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=400',
          backgroundColor: '#FCE4EC',
          buttonText: 'Ambil Promo',
        ),
      ];

  static List<Product> get products => [
        const Product(
          id: '1',
          name: 'Buah Berry Segar',
          description: 'Berry adalah buah manis berwarna merah',
          price: 4.5,
          rating: 4.5,
          reviewCount: 572,
          imageUrl:
              'https://images.unsplash.com/photo-1587393855524-087f83d95bc9?w=400',
          category: 'Buah',
          isOrganic: true,
          unit: '250g',
        ),
        const Product(
          id: '2',
          name: 'Daun Tulsi',
          description: 'Daun Tulsi sangat hijau dan segar',
          price: 2.0,
          rating: 4.8,
          reviewCount: 324,
          imageUrl:
              'https://images.unsplash.com/photo-1618375569909-3c8616cf7733?w=400',
          category: 'Herbal',
          isOrganic: true,
          unit: '100g',
        ),
        const Product(
          id: '3',
          name: 'Susu Segar',
          description: 'Susu murni segar dari peternakan',
          price: 3.2,
          rating: 4.5,
          reviewCount: 572,
          imageUrl:
              'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=400',
          category: 'Produk Susu',
          unit: '1L',
        ),
        const Product(
          id: '4',
          name: 'Tomat Matang',
          description: 'Tomat segar siap dimasak',
          price: 1.8,
          rating: 4.8,
          reviewCount: 224,
          imageUrl:
              'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=400',
          category: 'Sayuran',
          isOrganic: true,
          unit: '500g',
        ),
        const Product(
          id: '5',
          name: 'Mangga Manis',
          description: 'Raja buah, matang alami',
          price: 5.5,
          rating: 4.9,
          reviewCount: 891,
          imageUrl:
              'https://images.unsplash.com/photo-1601493700631-2b16ec4b4716?w=400',
          category: 'Buah',
          isOrganic: true,
          unit: '3 buah',
        ),
        const Product(
          id: '6',
          name: 'Beras Merah',
          description: 'Beras utuh, bergizi dan sehat',
          price: 6.0,
          rating: 4.6,
          reviewCount: 412,
          imageUrl:
              'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=400',
          category: 'Biji-bijian',
          unit: '1kg',
        ),
        const Product(
          id: '7',
          name: 'Bayam Muda',
          description: 'Daun lembut, segar dari kebun',
          price: 2.5,
          rating: 4.7,
          reviewCount: 287,
          imageUrl:
              'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=400',
          category: 'Sayuran',
          isOrganic: true,
          unit: '200g',
        ),
        const Product(
          id: '8',
          name: 'Alpukat',
          description: 'Lembut, matang dan siap disantap',
          price: 7.5,
          rating: 4.8,
          reviewCount: 634,
          imageUrl:
              'https://images.unsplash.com/photo-1601039641847-7857b994d704?w=400',
          category: 'Buah',
          isOrganic: true,
          unit: '2 buah',
        ),
      ];

  static List<Product> get flashSaleProducts => [
        const Product(
          id: 'f1',
          name: 'Apel Merah',
          description: 'Renya dan manis, segar dari kebun',
          price: 3.2,
          rating: 4.7,
          reviewCount: 445,
          imageUrl:
              'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=400',
          category: 'Buah',
          unit: '1kg',
          isOrganic: true,
        ),
        const Product(
          id: 'f2',
          name: 'Brokoli',
          description: 'Floret hijau segar, kaya vitamin',
          price: 2.8,
          rating: 4.5,
          reviewCount: 312,
          imageUrl:
              'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=400',
          category: 'Sayuran',
          unit: '500g',
        ),
        const Product(
          id: 'f3',
          name: 'Buah Naga',
          description: 'Eksotis, menyegarkan dan bergizi',
          price: 8.9,
          rating: 4.9,
          reviewCount: 198,
          imageUrl:
              'https://images.unsplash.com/photo-1527325678964-54921661f888?w=400',
          category: 'Buah',
          unit: '1 buah',
          isOrganic: true,
        ),
      ];
}