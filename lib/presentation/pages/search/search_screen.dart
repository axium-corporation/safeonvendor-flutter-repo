import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/search/search_controller.dart'
    as search_ctrl;
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';

class SearchScreen extends GetView<search_ctrl.SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhite,
      body: Column(
        children: [
          // Header
          _buildHeader(),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recent Searches Header
                  Text(
                    'Recent Searches',
                    style: AppTextStyles.kInterTextStyle14with500(
                      AppColor.pureBlack,
                    ).copyWith(fontSize: 16, height: 1.25, letterSpacing: -0.01),
                  ),

                  const SizedBox(height: 12),

                  // Recent Searches Chips
                  _buildRecentSearches(),

                  const SizedBox(height: 28),

                  // Browse Categories Header
                  Text(
                    'Browse Categories',
                    style: AppTextStyles.kInterTextStyle14with500(
                      AppColor.pureBlack,
                    ).copyWith(fontSize: 16, height: 1.25, letterSpacing: -0.01),
                  ),

                  const SizedBox(height: 13),

                  // Categories List
                  _buildCategories(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFF0071A4),
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 62,
          color: const Color(0xFF0071A4),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              // Back Button
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.pureWhite,
                  size: 18,
                ),
              ),
              const SizedBox(width: 9),
              // Search Field
              Expanded(
                child: Text(
                  'Search',
                  style: AppTextStyles.kInterTextStyle16with600(
                    AppColor.pureWhite,
                  ).copyWith(fontSize: 18, height: 1.21),
                ),
              ),
              // Filter Icon
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.filterRoute);
                },
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F9FB),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.tune,
                      color: const Color(0xFF0071A4),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      children: [
        // Search Bar
        Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xFF0071A4).withValues(alpha: 0.72),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 18,
                color: const Color(0xFF666666),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller.searchTextController,
                  onSubmitted: (value) => controller.performSearch(value),
                  style: AppTextStyles.kInterTextStyle14with400(
                    const Color(0xFF666666),
                  ).copyWith(height: 1.29),
                  decoration: InputDecoration(
                    hintText: 'Search Product, Category...',
                    hintStyle: AppTextStyles.kInterTextStyle14with400(
                      const Color(0xFF666666),
                    ).copyWith(height: 1.29),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Recent Searches Chips
        Obx(() => Wrap(
              spacing: 10,
              runSpacing: 10,
              children: controller.recentSearches.map((search) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: Colors.black.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        search,
                        style: AppTextStyles.kInterTextStyle14with500(
                          AppColor.pureBlack,
                        ).copyWith(height: 1.67),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => controller.removeRecentSearch(search),
                        child: Icon(
                          Icons.close,
                          size: 13,
                          color: AppColor.pureBlack,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )),
      ],
    );
  }

  Widget _buildCategories() {
    return Obx(() => Column(
          children: List.generate(
            controller.browseCategories.length,
            (index) {
              final category = controller.browseCategories[index];
              return GestureDetector(
                onTap: () => controller.selectCategory(category['name'] ?? ''),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 13),
                  child: Row(
                    children: [
                      // Category Icon
                      Container(
                        width: 40,
                        height: 37,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEFF2F9),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.category,
                            size: 18,
                            color: Color(0xFF0071A4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Category Name
                      Expanded(
                        child: Text(
                          category['name'] ?? '',
                          style: AppTextStyles.kInterTextStyle14with500(
                            const Color(0xFF202020),
                          ).copyWith(
                            fontSize: 13,
                            height: 1.62,
                            letterSpacing: -0.013,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}

