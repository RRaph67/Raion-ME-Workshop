// ================================================================
// NgeCafe — Helpers
// ================================================================

class AppHelpers {
  AppHelpers._();

  /// Format angka menjadi format Rupiah.
  /// Contoh: 22000 → 'Rp 22.000'
  static String formatRupiah(double amount) {
    final formatted = amount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        );
    return 'Rp $formatted';
  }

  /// Ambil inisial dari nama lengkap untuk avatar fallback.
  /// Contoh: 'Admin NgeCafe' → 'AN'
  static String getInitials(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  /// Validasi format email sederhana.
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Validasi password minimal 8 karakter.
  static bool isValidPassword(String password) => password.length >= 8;

  /// Kapitalisasi huruf pertama setiap kata.
  /// Contoh: 'kopi susu' → 'Kopi Susu'
  static String toTitleCase(String text) {
    return text
        .toLowerCase()
        .split(' ')
        .map((word) =>
            word.isEmpty ? '' : '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }
}
