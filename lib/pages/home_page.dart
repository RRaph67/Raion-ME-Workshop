// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../organisms/home_app_bar.dart';
import '../organisms/banner_carousel.dart';
import '../organisms/category_section.dart';
import '../organisms/product_grid.dart';
import '../organisms/section_header.dart';
import '../molecules/search_bar_widget.dart';
import '../molecules/product_card.dart';
import '../utils/app_data.dart';
import '../utils/app_theme.dart';
import '../providers/app_provider.dart';
import '../models/product_model.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final isSearching = provider.isSearching;

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
                // Search bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: SearchBarWidget(onFilterTap: () {}),
                ),

                // Search Results
                if (isSearching) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '${provider.searchResults.length} results for "${provider.searchQuery}"',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (provider.searchResults.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.search_off_rounded, size: 60, color: AppColors.textLight),
                            const SizedBox(height: 12),
                            const Text(
                              'No results found',
                              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: provider.searchResults
                            .map((p) => ProductCard(
                                  product: p,
                                  isHorizontal: true,
                                  onTap: () => _goToDetail(context, p),
                                ))
                            .toList(),
                      ),
                    ),
                ] else ...[
                  // Carousel Banner
                  BannerCarousel(banners: AppData.banners),
                  const SizedBox(height: 24),

                  // Categories
                  SectionHeader(
                    title: 'Categories',
                    subtitle: 'What are you looking for?',
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
                  const CategorySection(),
                  const SizedBox(height: 24),

                  // Flash Sale
                  SectionHeader(
                    title: '⚡ Flash Sale',
                    subtitle: 'Limited time offers',
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
                    title: 'Browse Products',
                    subtitle: provider.selectedCategory == 'All'
                        ? 'All fresh items'
                        : provider.selectedCategory,
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
                    products: provider.filteredProducts,
                    onProductTap: (p) => _goToDetail(context, p),
                  ),
                  const SizedBox(height: 24),
                ],
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
