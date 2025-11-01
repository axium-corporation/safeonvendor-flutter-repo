import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/categories/categories_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/categories/widgets/categories_screen_header.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/categories/widgets/category_filter_chip.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/categories/widgets/category_product_grid.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhite,
      body: Column(
        children: [
          // Header with back button, title, search, and filter
          const CategoriesScreenHeader(),

          // Filter Chips Row
          Container(
            height: 41,
            decoration: BoxDecoration(
              color: AppColor.pureWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                scrollDirection: Axis.horizontal,
                itemCount: controller.filterCategories.length,
                itemBuilder: (context, index) {
                  return CategoryFilterChip(
                    label: controller.filterCategories[index],
                    isSelected: controller.selectedFilterIndex.value == index,
                    onTap: () => controller.updateFilter(index),
                  );
                },
              ),
            ),
          ),

          // Scrollable Content
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.refreshData,
              color: AppColor.homePrimary,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.homePrimary,
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.only(top: 20, bottom: 120),
                  itemCount: controller.filteredCategories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 25),
                  itemBuilder: (context, index) {
                    final category = controller.filteredCategories[index];
                    return CategoryProductGrid(
                      categoryName: category['categoryName'] ?? '',
                      products: category['products'] ?? [],
                      onSeeAllTap: () {
                        // Navigate to category details
                      },
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
