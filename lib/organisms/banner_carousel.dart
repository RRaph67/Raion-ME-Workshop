// lib/organisms/banner_carousel.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart' as m;
import '../molecules/banner_card.dart';
import '../utils/app_theme.dart';
import '../providers/app_provider.dart';

class BannerCarousel extends StatelessWidget {
  final List<m.Banner> banners;

  const BannerCarousel({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220,
            viewportFraction: 0.92,
            enlargeCenterPage: true,
            enlargeFactor: 0.08,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 700),
            autoPlayCurve: Curves.easeInOutCubic,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) => provider.setCarouselIndex(index),
          ),
          items: banners
              .map((banner) => BannerCard(banner: banner, onTap: () {}))
              .toList(),
        ),
        const SizedBox(height: 14),
        AnimatedSmoothIndicator(
          activeIndex: provider.carouselIndex,
          count: banners.length,
          effect: ExpandingDotsEffect(
            dotColor: AppColors.primary.withOpacity(0.25),
            activeDotColor: AppColors.primary,
            dotHeight: 7,
            dotWidth: 7,
            expansionFactor: 3,
            spacing: 5,
          ),
        ),
      ],
    );
  }
}
