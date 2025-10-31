import 'package:flutter/material.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';

class CommonProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String currentPrice;
  final String originalPrice;
  final String discount;
  final String saveAmount;
  final double rating;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final bool showDiscount;

  const CommonProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.currentPrice,
    required this.originalPrice,
    required this.discount,
    required this.saveAmount,
    this.rating = 0.0,
    this.onTap,
    this.onFavoriteTap,
    this.showDiscount = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: AppColor.pureWhite,
          borderRadius: BorderRadius.circular(9),
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
            // Product Image with Discount Badge
            Stack(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: AppColor.homeBackground,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(9),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(9),
                    ),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: AppColor.textGrey2,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Discount Badge
                if (showDiscount)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 7,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColor.homePrimary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(9),
                        ),
                      ),
                      child: Text(
                        discount,
                        style: AppTextStyles.kInterTextStyle14with600(
                          AppColor.pureWhite,
                        ),
                      ),
                    ),
                  ),
                // Favorite Button
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: AppColor.pureWhite,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 12,
                        color: AppColor.homeHeading,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Product Details
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.kInterTextStyle14with500(
                      AppColor.homeHeading,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Star Rating
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating.floor() ? Icons.star : Icons.star_border,
                        size: 13,
                        color: AppColor.homeStarYellow,
                      );
                    }),
                  ),
                  const SizedBox(height: 8),
                  // Price Section
                  Row(
                    children: [
                      Text(
                        currentPrice,
                        style: AppTextStyles.kInterTextStyle12with700(
                          AppColor.homeHeading,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        originalPrice,
                        style:
                            AppTextStyles.kInterTextStyle12with400(
                              AppColor.homeHeading,
                            ).copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColor.homeHeading,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Save Amount
                  Text(
                    saveAmount,
                    style: AppTextStyles.kInterTextStyle12with600(
                      AppColor.homeSuccessGreen,
                    ),
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
