import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/home/home_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';
import 'package:safeonvendor_flutter_repo/presentation/widgets/common_product_card.dart';
import 'package:safeonvendor_flutter_repo/presentation/widgets/common_section_header.dart';

class HomeProductsSection extends GetView<HomeController> {
  final String title;
  final List<Map<String, dynamic>> products;
  final VoidCallback? onSeeAllTap;

  const HomeProductsSection({
    super.key,
    required this.title,
    required this.products,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonSectionHeader(
          title: title,
          onSeeAllTap:
              onSeeAllTap ??
              () {
                // Default see all action
              },
        ),
        const SizedBox(height: 10),
        // Horizontal Scrollable Products
        SizedBox(
          height: 280,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 6),
            itemBuilder: (context, index) {
              final product = products[index];
              return CommonProductCard(
                imageUrl: product['imageUrl'] ?? '',
                productName: product['productName'] ?? '',
                currentPrice: product['currentPrice'] ?? '',
                originalPrice: product['originalPrice'] ?? '',
                discount: product['discount'] ?? '',
                saveAmount: product['saveAmount'] ?? '',
                rating: (product['rating'] ?? 0.0).toDouble(),
                showDiscount: product['showDiscount'] ?? true,
                onTap: () {
                  Get.toNamed(Routes.productDetailsRoute);
                },
                onFavoriteTap: () {
                  // Handle favorite tap
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
