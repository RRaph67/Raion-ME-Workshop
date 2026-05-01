// lib/organisms/product_grid.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../molecules/product_card.dart';
import '../utils/app_theme.dart';
import '../providers/app_provider.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onProductTap;

  const ProductGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Icon(Icons.search_off_rounded, size: 64, color: AppColors.textLight),
            const SizedBox(height: 16),
            const Text(
              'No products found',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Try a different category or search',
              style: TextStyle(fontSize: 13, color: AppColors.textLight),
            ),
          ],
        ),
      );
    }

    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.72,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 2,
            duration: const Duration(milliseconds: 400),
            child: SlideAnimation(
              verticalOffset: 40,
              child: FadeInAnimation(
                child: ProductCard(
                  product: products[index],
                  onTap: () => onProductTap(products[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Flash sale horizontal list
class FlashSaleSection extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onProductTap;

  const FlashSaleSection({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 155,
            child: ProductCard(
              product: products[index],
              onTap: () => onProductTap(products[index]),
            ),
          );
        },
      ),
    );
  }
}
