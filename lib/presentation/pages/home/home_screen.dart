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
              // Header with Logo and Search
              const HomeScreenHeader(),

              // Featured Banner
              const SizedBox(height: 20),
              const HomeFeaturedBanner(),

              // Categories Section
              const SizedBox(height: 30),
              const HomeCategoriesSection(),

              // Top Products Section
              const SizedBox(height: 29),
              const HomeTopProductsSection(),

              // New Products Section
              const SizedBox(height: 29),
              // Obx(() {
              // return
              HomeProductsSection(
                title: 'New Products',
                products: controller.newProducts,
                onSeeAllTap: () {
                  // Navigate to all new products
                },
              ),
              // }),

              // Popular Products Section
              const SizedBox(height: 20),
              // Obx(() {
              // return
              HomeProductsSection(
                title: 'Popular Products',
                products: controller.popularProducts,
                onSeeAllTap: () {
                  // Navigate to all popular products
                },
              ),
              // }),

              // Bottom Spacing for Navigation Bar
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
