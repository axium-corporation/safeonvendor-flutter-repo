import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/home/home_controller.dart';

class HomeTopProductsSection extends GetView<HomeController> {
  const HomeTopProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Top Products',
            style: AppTextStyles.kRalewayTextStyle21with700(
              AppColor.homeHeading,
            ),
          ),
        ),
        const SizedBox(height: 29),
        // Horizontal Scrollable List with slide-in animations
        SizedBox(
          height: 75,
          child: Obx(() {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: controller.topProducts.length,
              separatorBuilder: (context, index) => const SizedBox(width: 9),
              itemBuilder: (context, index) {
                final product = controller.topProducts[index];
                // Staggered animation for each product card
                return TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 400 + (index * 50)),
                  tween: Tween(begin: 0.0, end: 1.0),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(30 * (1 - value), 0),
                      child: Transform.scale(
                        scale: 0.85 + (0.15 * value),
                        child: Opacity(
                          opacity: value,
                          child: _TopProductCard(
                            title: product['title'] ?? '',
                            imageUrl: product['imageUrl'] ?? '',
                            onTap: () {
                              // Handle product tap
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

class _TopProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const _TopProductCard({
    required this.title,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Circle Container with Enhanced Shadow
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColor.pureWhite,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ClipOval(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.homeBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.shopping_bag,
                          size: 30,
                          color: AppColor.homeTextGray,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
          // Title
          SizedBox(
            width: 60,
            height: 13,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.kRalewayTextStyle13with500(
                AppColor.homeHeading,
              ).copyWith(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
