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
        // Horizontal Scrollable List
        SizedBox(
          height: 69,
          child: Obx(() {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: controller.topProducts.length,
              separatorBuilder: (context, index) => const SizedBox(width: 9),
              itemBuilder: (context, index) {
                final product = controller.topProducts[index];
                return _TopProductCard(
                  title: product['title'] ?? '',
                  imageUrl: product['imageUrl'] ?? '',
                  onTap: () {
                    // Handle product tap
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
          // Circle Container with Shadow
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColor.pureWhite,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.16),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
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
          const SizedBox(height: 9),
          // Title
          SizedBox(
            width: 60,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.kRalewayTextStyle13with500(
                AppColor.homeHeading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
