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
        const SizedBox(height: 16),
        // Horizontal Scrollable Products with staggered animations
        SizedBox(
          height: 310,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final product = products[index];
              // Staggered animation for each product card
              return TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 350 + (index * 40)),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(20 * (1 - value), 0),
                    child: Transform.scale(
                      scale: 0.85 + (0.08 * value),
                      child: Opacity(
                        opacity: value,
                        child: CommonProductCard(
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
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
