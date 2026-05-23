// ================================================================
// NgeCafe — App Constants
// ================================================================

class AppConstants {
  AppConstants._();

  // ── API ────────────────────────────────────────────────────
  // TODO: Ganti dengan base URL API nyata
  static const String baseUrl = 'https://api.ngecafe.id/v1';
  static const Duration requestTimeout = Duration(seconds: 15);

  // ── Storage Keys (SharedPreferences / SecureStorage) ───────
  static const String keyAuthToken = 'auth_token';
  static const String keyUserData = 'user_data';

  // ── Kategori Produk ────────────────────────────────────────
  static const List<String> productCategories = [
    'Semua',
    'Kopi',
    'Non-Kopi',
    'Makanan',
  ];

  // ── Warna Tema (mirror dari CSS variables) ─────────────────
  static const int colorGreen800 = 0xFF2D5016;
  static const int colorGreen700 = 0xFF3A6B1A;
  static const int colorGreen100 = 0xFFE8F5E0;
}
