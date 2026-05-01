// lib/pages/product_detail_page.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../atoms/app_image.dart';
import '../atoms/star_rating.dart';
import '../atoms/app_badge.dart';
import '../utils/app_theme.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with SingleTickerProviderStateMixin {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // App Bar dengan gambar produk
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: AppColors.background,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: AppImage(
                imageUrl: widget.product.imageUrl,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(28)),
              ),
            ),
          ),

          // Konten
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama & badge
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      if (widget.product.isOrganic)
                        AppBadge(
                          label: '🌿 Organik',
                          backgroundColor: AppColors.greenLight,
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      AppBadge(
                        label: widget.product.category,
                        backgroundColor: AppColors.orangeLight,
                        textColor: AppColors.accent,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'per ${widget.product.unit}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Rating
                  Row(
                    children: [
                      StarRating(
                        rating: widget.product.rating,
                        reviewCount: widget.product.reviewCount,
                        size: 14,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '• ${widget.product.reviewCount} ulasan',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Deskripsi
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.product.description}\n\nDipetik segar dari petani lokal untuk menjaga kesegaran dan nilai gizi. Produk kami dipilih dengan hati-hati dan dikirim dalam waktu 24 jam setelah panen untuk menjamin kualitas terbaik.',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Informasi gizi dummy
                  const Text(
                    'Informasi Gizi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _nutritionChip('🔥 Kalori', '52 kkal'),
                      const SizedBox(width: 8),
                      _nutritionChip('💪 Protein', '0.7g'),
                      const SizedBox(width: 8),
                      _nutritionChip('🧪 Karbohidrat', '13.8g'),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom bar sederhana
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: MediaQuery.of(context).padding.bottom + 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Row(
          children: [
            // Harga total
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Harga',
                  style:
                      TextStyle(fontSize: 11, color: AppColors.textSecondary),
                ),
                Text(
                  'Rp ${(widget.product.price * _qty).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Kontrol jumlah
            Row(
              children: [
                _qtyButton(Icons.remove, () {
                  if (_qty > 1) setState(() => _qty--);
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    '$_qty',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                _qtyButton(Icons.add, () => setState(() => _qty++)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: AppColors.greenLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: AppColors.primary),
      ),
    );
  }

  Widget _nutritionChip(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          children: [
            Text(label,
                style: const TextStyle(
                    fontSize: 10, color: AppColors.textSecondary)),
            const SizedBox(height: 3),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
