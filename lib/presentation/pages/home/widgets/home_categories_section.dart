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
        // Categories Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(() {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
                childAspectRatio: 0.87,
              ),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return CommonCategoryCard(
                  title: category['title'] ?? '',
                  imageUrl: category['imageUrl'] ?? '',
                  onTap: () {
                    // Handle category tap
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

