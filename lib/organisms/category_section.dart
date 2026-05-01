// lib/organisms/category_section.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../molecules/category_chip.dart';
import '../utils/app_data.dart';
import '../providers/app_provider.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<AppProvider>().selectedCategory;
    final categories = AppData.categories;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          AllCategoryChip(
            isSelected: selected == 'All',
            onTap: () => context.read<AppProvider>().setCategory('All'),
          ),
          ...categories.map((cat) => CategoryChip(
                category: cat,
                isSelected: selected == cat.name,
                onTap: () => context.read<AppProvider>().setCategory(cat.name),
              )),
        ],
      ),
    );
  }
}
