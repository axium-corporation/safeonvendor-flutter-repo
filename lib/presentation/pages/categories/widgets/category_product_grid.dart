import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';
import 'package:safeonvendor_flutter_repo/presentation/widgets/common_product_card.dart';

class CategoryProductGrid extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> products;
  final VoidCallback? onSeeAllTap;

  const CategoryProductGrid({
    super.key,
    required this.categoryName,
    required this.products,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Header with See All
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  categoryName,
                  style: AppTextStyles.kInterTextStyle16with600(
                    AppColor.homeHeading,
                  ).copyWith(
                    height: 1.875,
                    letterSpacing: -0.21,
                  ),
                ),
              ),
              if (onSeeAllTap != null)
                GestureDetector(
                  onTap: onSeeAllTap,
                  child: Row(
                    children: [
                      Text(
                        'See All',
                        style: AppTextStyles.kInterTextStyle15with600(
                          AppColor.homeHeading,
                        ),
                      ),
                      const SizedBox(width: 13),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColor.pureWhite,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: AppColor.homePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 9),
        // Product Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Wrap(
            spacing: 6,
            runSpacing: 16,
            children: products.map((product) {
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
            }).toList(),
          ),
        ),
      ],
    );
  }
}

