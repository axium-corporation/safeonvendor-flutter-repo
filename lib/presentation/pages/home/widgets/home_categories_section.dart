import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/home/home_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/widgets/common_category_card.dart';
import 'package:safeonvendor_flutter_repo/presentation/widgets/common_section_header.dart';

class HomeCategoriesSection extends GetView<HomeController> {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonSectionHeader(
          title: 'Categories',
          onSeeAllTap: () {
            // Handle see all categories
          },
        ),
        const SizedBox(height: 28),
        // Categories Horizontal Scrollable List with staggered animations
        SizedBox(
          height: 160,
          child: Obx(() {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: controller.categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                // Staggered animation delay based on index
                return TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 300 + (index * 50)),
                  tween: Tween(begin: 0.0, end: 1.0),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: 0.9 + (0.1 * value),
                      child: Opacity(
                        opacity: value,
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: CommonCategoryCard(
                            title: category['title'] ?? '',
                            imageUrl: category['imageUrl'] ?? '',
                            onTap: () {
                              // Handle category tap
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
