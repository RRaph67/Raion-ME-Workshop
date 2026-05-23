// lib/organisms/product_grid.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../bloc/product/product_bloc.dart';
import '../../bloc/product/product_event.dart';
import '../../bloc/product/product_state.dart';
import '../../models/product_model.dart';
import '../molecules/product_card.dart';
import '../utils/app_theme.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductLoaded) {
          final products = state.products;
          if (products.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Icon(Icons.search_off_rounded,
                      size: 64, color: AppColors.textLight),
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
                childAspectRatio: 0.65,
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
                        onTap: () {
                          // contoh: tampilkan detail
                          context.read<ProductBloc>().add(
                                FetchProductDetail(products[index].id),
                              );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        if (state is ProductError) {
          return Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Coba Lagi'),
              onPressed: () {
                context.read<ProductBloc>().add(const FetchProducts());
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

// Flash sale horizontal list — ambil dari state juga
class FlashSaleSection extends StatelessWidget {
  const FlashSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded && state.products.isNotEmpty) {
          final products = state.products.take(5).toList(); // contoh limit
          return SizedBox(
            height: 280,
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
                    onTap: () {
                      context.read<ProductBloc>().add(
                            FetchProductDetail(products[index].id),
                          );
                    },
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
