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
        width: 160,
        decoration: BoxDecoration(
          color: AppColor.pureWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 6),
              spreadRadius: -2,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
              spreadRadius: -1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Photography-Style Image Section
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Main Image - Photography Style
                    Container(
                      color: AppColor.homeBackground,
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColor.homeBackground,
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: AppColor.textGrey2,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Gradient Overlay at Bottom for Text Readability
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Discount Badge - Top Left
                    if (showDiscount)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.homePrimary,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.homePrimary.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            discount,
                            style:
                                AppTextStyles.kInterTextStyle12with700(
                                  AppColor.pureWhite,
                                ).copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.3,
                                ),
                          ),
                        ),
                      ),
                    // Favorite Button - Top Right
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onFavoriteTap,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColor.pureWhite.withOpacity(0.95),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              size: 16,
                              color: AppColor.homeHeading,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Product Name Overlay on Image (Bottom)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              productName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppTextStyles.kInterTextStyle14with500(
                                    AppColor.pureWhite,
                                  ).copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.6),
                                        blurRadius: 6,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                            ),
                            const SizedBox(height: 4),
                            // Star Rating on Image
                            Row(
                              children: List.generate(5, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: index < 4 ? 3 : 0,
                                  ),
                                  child: Icon(
                                    index < rating.floor()
                                        ? Icons.star
                                        : Icons.star_border,
                                    size: 13,
                                    color: index < rating.floor()
                                        ? AppColor.homeStarYellow
                                        : Colors.white.withOpacity(0.7),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Price Section - Below Image
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        currentPrice,
                        style:
                            AppTextStyles.kInterTextStyle12with700(
                              AppColor.homeHeading,
                            ).copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.3,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        originalPrice,
                        style:
                            AppTextStyles.kInterTextStyle12with400(
                              AppColor.homeTextGray,
                            ).copyWith(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColor.homeTextGray,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Save Amount with Creative Styling
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.homeSuccessGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      saveAmount,
                      style:
                          AppTextStyles.kInterTextStyle12with600(
                            AppColor.homeSuccessGreen,
                          ).copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
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
