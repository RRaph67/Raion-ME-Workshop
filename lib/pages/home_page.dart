// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product/product_bloc.dart';
import '../bloc/product/product_event.dart';
import '../organisms/product_grid.dart';
import '../organisms/section_header.dart';
import '../organisms/banner_carousel.dart';
import '../molecules/search_bar_widget.dart';
import '../utils/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _categories = ['Semua', 'Kopi', 'Non-Kopi', 'Makanan'];
  String _selectedCategory = 'Semua';

  @override
  void initState() {
    super.initState();
    // Fetch produk pertama kali
    context.read<ProductBloc>().add(const FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('FreshMarket'),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar (dummy)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: SearchBarWidget(onFilterTap: () {}),
                ),

                // Banner carousel
                BannerCarousel(banners: const []), // isi sesuai model Banner
                const SizedBox(height: 24),

                // Filter kategori
                _CategoryFilter(
                  categories: _categories,
                  selected: _selectedCategory,
                  onSelected: (cat) {
                    setState(() => _selectedCategory = cat);
                    context.read<ProductBloc>().add(
                          FetchProducts(category: cat == 'Semua' ? null : cat),
                        );
                  },
                ),
                const SizedBox(height: 16),

                // Flash Sale Section
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
                const FlashSaleSection(), // organism baru pakai BlocBuilder
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
                const ProductGrid(), // organism baru pakai BlocBuilder
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Molecule sederhana untuk filter kategori
class _CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelected;

  const _CategoryFilter({
    required this.categories,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isActive = cat == selected;
          return FilterChip(
            label: Text(cat),
            selected: isActive,
            onSelected: (_) => onSelected(cat),
            selectedColor: AppColors.primary,
            labelStyle: TextStyle(
              color: isActive ? Colors.white : AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            backgroundColor: const Color(0xFFE8F5E0),
            checkmarkColor: Colors.white,
          );
        },
      ),
    );
  }
}
