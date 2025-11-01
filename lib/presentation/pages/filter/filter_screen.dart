import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/filter/filter_controller.dart';

class FilterScreen extends GetView<FilterController> {
  const FilterScreen({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price Filter
                  _buildPriceFilter(),

                  const SizedBox(height: 24),

                  // Product Category
                  _buildProductCategory(),

                  const SizedBox(height: 24),

                  // Filter by Brand
                  _buildBrandFilter(),

                  const SizedBox(height: 24),

                  // Filter by Reviews
                  _buildReviewsFilter(),

                  const SizedBox(height: 100),
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
      color: AppColor.pureWhite,
      child: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
          decoration: BoxDecoration(
            color: AppColor.pureWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter',
                style: AppTextStyles.kInterTextStyle16with600(
                  const Color(0xFF202020),
                ).copyWith(
                  fontSize: 28,
                  height: 1.29,
                  letterSpacing: -0.01,
                ),
              ),
              GestureDetector(
                onTap: () => controller.resetAll(),
                child: Text(
                  'Reset All',
                  style: AppTextStyles.kInterTextStyle14with400(
                    AppColor.homePrimary,
                  ).copyWith(height: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceFilter() {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF4F4F4), width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FILTER BY PRICE',
            style: AppTextStyles.kInterTextStyle14with500(
              const Color(0xFF717378),
            ).copyWith(
              height: 1.5,
              letterSpacing: 0.07,
            ),
          ),
          const SizedBox(height: 20),

          // Price Range Slider
          Obx(() => Column(
                children: [
                  // Slider Track
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      // Active Track (would need custom slider for this)
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Min and Max Labels
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // MIN
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              '₹${controller.minPrice.value}',
                              style: AppTextStyles.kInterTextStyle12with400(
                                const Color(0xFF060709),
                              ).copyWith(height: 1.5),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColor.pureWhite,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColor.pureBlack,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // MAX
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              '₹${controller.maxPrice.value}',
                              style: AppTextStyles.kInterTextStyle12with400(
                                const Color(0xFF060709),
                              ).copyWith(height: 1.5),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColor.pureWhite,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColor.pureBlack,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Apply Button
                  GestureDetector(
                    onTap: () => controller.applyFilters(),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0071A4),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: AppTextStyles.kInterTextStyle14with400(
                            AppColor.pureWhite,
                          ).copyWith(height: 1.5),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildProductCategory() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF4F4F4), width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PRODUCT CATEGORY',
            style: AppTextStyles.kInterTextStyle14with500(
              const Color(0xFF717378),
            ).copyWith(
              height: 1.5,
              letterSpacing: 0.07,
            ),
          ),
          const SizedBox(height: 12),
          Obx(() => Column(
                children: List.generate(
                  controller.categories.length,
                  (index) {
                    final category = controller.categories[index];
                    final categoryName = category['name'] as String;
                    final isSelected = controller.selectedCategories
                        .contains(categoryName);

                    return GestureDetector(
                      onTap: () => controller.toggleCategory(categoryName),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            // Checkbox
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFECA61B)
                                    : AppColor.pureWhite,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFFECA61B)
                                      : const Color(0xFFF4F4F4),
                                  width: 1,
                                ),
                              ),
                              child: isSelected
                                  ? const Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            // Category Name
                            Expanded(
                              child: Text(
                                categoryName,
                                style: AppTextStyles.kInterTextStyle14with400(
                                  const Color(0xFF46494F),
                                ).copyWith(height: 1.5),
                              ),
                            ),
                            // Line
                            Container(
                              width: 0,
                              height: 11,
                              color: const Color(0xFFF4F4F4),
                            ),
                            const SizedBox(width: 12),
                            // Count
                            Text(
                              '${category['count']}',
                              style: AppTextStyles.kInterTextStyle14with400(
                                const Color(0xFF9D9EA2),
                              ).copyWith(height: 1.5),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildBrandFilter() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF4F4F4), width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FILTER BY BRAND',
            style: AppTextStyles.kInterTextStyle14with500(
              const Color(0xFF717378),
            ).copyWith(
              height: 1.5,
              letterSpacing: 0.07,
            ),
          ),
          const SizedBox(height: 12),
          Obx(() => Column(
                children: List.generate(
                  controller.brands.length,
                  (index) {
                    final brand = controller.brands[index];
                    final isSelected = controller.selectedBrands.contains(brand);

                    return GestureDetector(
                      onTap: () => controller.toggleBrand(brand),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            // Checkbox
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFECA61B)
                                    : AppColor.pureWhite,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFFECA61B)
                                      : const Color(0xFFF4F4F4),
                                  width: 1,
                                ),
                              ),
                              child: isSelected
                                  ? const Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            // Brand Name
                            Expanded(
                              child: Text(
                                brand,
                                style: AppTextStyles.kInterTextStyle14with400(
                                  const Color(0xFF46494F),
                                ).copyWith(height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildReviewsFilter() {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FILTER BY REVIEWS',
            style: AppTextStyles.kInterTextStyle14with500(
              const Color(0xFF717378),
            ).copyWith(
              height: 1.5,
              letterSpacing: 0.083,
            ),
          ),
          const SizedBox(height: 16),
          Obx(() => Column(
                children: List.generate(5, (index) {
                  final rating = 5 - index;
                  final isSelected = controller.selectedRating.value == rating;

                  return GestureDetector(
                    onTap: () => controller.selectRating(rating),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          // Checkbox
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFECA61B)
                                  : AppColor.pureWhite,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFECA61B)
                                    : const Color(0xFFC8C9CB),
                                width: 1,
                              ),
                            ),
                            child: isSelected
                                ? const Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 4),
                          // Stars
                          Row(
                            children: List.generate(rating, (index) {
                              return Icon(
                                Icons.star,
                                size: 14,
                                color: const Color(0xFFF2BC1B),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              )),
        ],
      ),
    );
  }
}

