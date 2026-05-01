// lib/organisms/home_app_bar.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../atoms/app_badge.dart';
import '../utils/app_theme.dart';
import '../providers/app_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<AppProvider>().cartCount;

    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      title: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.eco_rounded, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'FreshMarket',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
              Text(
                'Your daily freshness 🌿',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        // Notification
        IconButton(
          onPressed: () {},
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications_outlined, size: 24, color: AppColors.textPrimary),
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Cart
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CartBadge(
            count: cartCount,
            child: IconButton(
              onPressed: () => context.read<AppProvider>().setNavIndex(2),
              icon: const Icon(Icons.shopping_bag_outlined, size: 24, color: AppColors.textPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
