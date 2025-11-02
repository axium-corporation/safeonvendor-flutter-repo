import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/home/home_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/home/widgets/home_categories_section.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/home/widgets/home_featured_banner.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/home/widgets/home_products_section.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/home/widgets/home_screen_header.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/home/widgets/home_top_products_section.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhite,
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        color: AppColor.homePrimary,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Logo and Search - Animated with 200ms delay
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 400),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: Opacity(
                      opacity: value,
                      child: const HomeScreenHeader(),
                    ),
                  );
                },
              ),

              // Featured Banner - Animated with 300ms delay
              const SizedBox(height: 20),
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 500),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: 0.95 + (0.05 * value),
                    child: Opacity(
                      opacity: value,
                      child: const HomeFeaturedBanner(),
                    ),
                  );
                },
              ),

              // Categories Section - Animated with 400ms delay
              const SizedBox(height: 30),
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 500),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: const HomeCategoriesSection(),
                  );
                },
              ),

              // Top Products Section - Animated with 500ms delay
              const SizedBox(height: 29),
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 500),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(30 * (1 - value), 0),
                    child: Opacity(
                      opacity: value,
                      child: const HomeTopProductsSection(),
                    ),
                  );
                },
              ),

              // New Products Section - Animated with 600ms delay
              const SizedBox(height: 29),
              Obx(() {
                // Access observable directly - .length ensures GetX tracks it
                controller.newProducts.length; // Create dependency
                return TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 500),
                  tween: Tween(begin: 0.0, end: 1.0),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: HomeProductsSection(
                        title: 'New Products',
                        products: controller.newProducts,
                        onSeeAllTap: () {
                          // Navigate to all new products
                        },
                      ),
                    );
                  },
                );
              }),

              // Popular Products Section - Animated with 650ms delay
              const SizedBox(height: 20),
              Obx(() {
                // Access observable directly - .length ensures GetX tracks it
                controller.popularProducts.length; // Create dependency
                return TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 500),
                  tween: Tween(begin: 0.0, end: 1.0),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: HomeProductsSection(
                        title: 'Popular Products',
                        products: controller.popularProducts,
                        onSeeAllTap: () {
                          // Navigate to all popular products
                        },
                      ),
                    );
                  },
                );
              }),

              // Bottom Spacing for Navigation Bar
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
