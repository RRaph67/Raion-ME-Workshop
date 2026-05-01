// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import '../organisms/home_app_bar.dart';
import '../organisms/banner_carousel.dart';
import '../organisms/product_grid.dart';
import '../organisms/section_header.dart';
import '../molecules/search_bar_widget.dart';
import '../utils/app_data.dart';
import '../utils/app_theme.dart';
import '../models/product_model.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar (dummy, tidak ada logic)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: SearchBarWidget(onFilterTap: () {}),
                ),

                // Carousel Banner
                BannerCarousel(banners: AppData.banners),
                const SizedBox(height: 24),

                // Flash Sale
                SectionHeader(
                  title: 'Flash Sale',
                  subtitle: 'Sikat Diskonya Bosqq',
                  actionText: 'See All',
                  onAction: () {},
                  leading: Container(
                    width: 6,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                FlashSaleSection(
                  products: AppData.flashSaleProducts,
                  onProductTap: (p) => _goToDetail(context, p),
                ),
                const SizedBox(height: 24),

                // Browse Products
                SectionHeader(
                  title: 'Cari Buah',
                  subtitle: 'Semua Buah Segar',
                  actionText: 'View All',
                  onAction: () {},
                  leading: Container(
                    width: 6,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                ProductGrid(
                  products: AppData.products,
                  onProductTap: (p) => _goToDetail(context, p),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _goToDetail(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailPage(product: product),
      ),
    );
  }
}
