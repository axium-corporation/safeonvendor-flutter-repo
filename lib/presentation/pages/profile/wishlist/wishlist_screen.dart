import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/wishlist_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';

class WishlistScreen extends GetView<WishlistController> {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Column(
        children: [
          // Header
          Container(
            color: AppColor.homePrimary,
            child: SafeArea(
              bottom: false,
              child: Container(
                height: 62,
                color: AppColor.homePrimary,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    // Back Button
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.pureWhite,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 9),
                    // Title
                    Expanded(
                      child: Obx(
                        () => Text(
                          'My Wishlist (${controller.wishlistItems.length})',
                          style: AppTextStyles.kInterTextStyle16with600(
                            AppColor.pureWhite,
                          ).copyWith(fontSize: 18, height: 1.2102272245619032),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.homePrimary),
                );
              }

              if (controller.wishlistItems.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 100,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Your wishlist is empty',
                        style: AppTextStyles.kInterTextStyle16with600(
                          AppColor.homeHeading,
                        ).copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                );
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(28),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.58,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 20,
                          ),
                      itemCount: controller.wishlistItems.length,
                      itemBuilder: (context, index) {
                        final item = controller.wishlistItems[index];
                        return _buildWishlistCard(item);
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.productDetailsRoute),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.pureWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with discount badge
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F3FC),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    item['imageUrl'] ?? '',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported, size: 40);
                    },
                  ),
                ),
                // Discount Badge
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 7,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF0071A4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      '${item['discount']}% OFF',
                      style: AppTextStyles.kInterTextStyle14with600(
                        AppColor.pureWhite,
                      ).copyWith(fontSize: 14, height: 1.1428571428571428),
                    ),
                  ),
                ),
                // Remove button
                Positioned(
                  top: 9,
                  right: 9,
                  child: GestureDetector(
                    onTap: () => controller.removeFromWishlist(item['id']),
                    child: Container(
                      width: 18,
                      height: 19,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFEFEF),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 12,
                        color: const Color(0xFF655E5E),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    item['productName'] ?? '',
                    style: AppTextStyles.kInterTextStyle14with500(
                      const Color(0xFF222222),
                    ).copyWith(height: 1.2857142857142858),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Price and Save info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Save - ₹${item['originalPrice'] - item['discountedPrice']}',
                        style: AppTextStyles.kInterTextStyle12with600(
                          const Color(0xFF249B3E),
                        ).copyWith(height: 1.5),
                      ),
                      Row(
                        children: [
                          Text(
                            '₹${item['discountedPrice']}',
                            style: AppTextStyles.kInterTextStyle12with700(
                              const Color(0xFF222222),
                            ).copyWith(height: 1.5),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '₹${item['originalPrice']}',
                            style:
                                AppTextStyles.kInterTextStyle12with400(
                                  const Color(0xFF222222),
                                ).copyWith(
                                  height: 1.5,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Rating
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        size: 12.77,
                        color: const Color(0xFFECA61B),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
