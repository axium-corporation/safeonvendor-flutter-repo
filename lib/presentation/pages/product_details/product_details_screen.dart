import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/product_details/product_details_controller.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhite,
      body: Column(
        children: [
          // Header
          _buildHeader(),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Images
                  _buildProductImages(),

                  // Product Details
                  Padding(
                    padding: const EdgeInsets.all(17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name
                        Obx(
                          () => Text(
                            controller.productName.value,
                            style: AppTextStyles.kInterTextStyle14with500(
                              const Color(0xFF060709),
                            ).copyWith(fontSize: 20, height: 1.3),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Tags
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: controller.tags.map((tag) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF2F6F4),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  tag,
                                  style: AppTextStyles.kInterTextStyle12with400(
                                    const Color(0xFF05422C),
                                  ).copyWith(height: 1.5),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Price and Rating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Price
                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '₹ ${controller.originalPrice.value}',
                                    style:
                                        AppTextStyles.kInterTextStyle14with400(
                                          const Color(0xFF9D9EA2),
                                        ).copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          height: 1.5,
                                        ),
                                  ),
                                  Text(
                                    '₹ ${controller.discountedPrice.value}  | ${controller.discount.value}% OFF',
                                    style:
                                        AppTextStyles.kInterTextStyle14with500(
                                          const Color(0xFFEB2606),
                                        ).copyWith(fontSize: 16, height: 1.5),
                                  ),
                                ],
                              ),
                            ),

                            // Rating
                            Obx(
                              () => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 14,
                                      color: const Color(0xFFF2BC1B),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '${controller.rating.value}/5',
                                      style:
                                          AppTextStyles.kInterTextStyle14with400(
                                            const Color(0xFF060709),
                                          ).copyWith(height: 1.5),
                                    ),
                                    Container(
                                      width: 1,
                                      height: 12,
                                      color: const Color(0xFFC8C9CB),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                      ),
                                    ),
                                    Text(
                                      '${controller.reviewsCount.value}',
                                      style:
                                          AppTextStyles.kInterTextStyle14with400(
                                            const Color(0xFF060709),
                                          ).copyWith(height: 1.5),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Reviews',
                                      style:
                                          AppTextStyles.kInterTextStyle12with400(
                                            const Color(0xFF9D9EA2),
                                          ).copyWith(height: 1.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // GST Info
                        Obx(
                          () => Text(
                            '₹${controller.gst.value} GST   |   ₹${controller.totalWithTaxes.value} (Incl. of all taxes)',
                            style: AppTextStyles.kInterTextStyle14with400(
                              const Color(0xFF9D9EA2),
                            ).copyWith(height: 1.5),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Specifications
                        _buildSpecifications(),

                        const SizedBox(height: 24),

                        // Tabs (Description, Reviews, Specifications)
                        _buildTabs(),

                        const SizedBox(height: 24),

                        // Action Box (Quantity + Add to Cart + Buy Now)
                        _buildActionBox(),

                        const SizedBox(height: 24),

                        // Safe On Benefits
                        _buildBenefits(),

                        const SizedBox(height: 29),

                        // Related Products
                        _buildRelatedProducts(),

                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
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
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.pureWhite,
                  size: 18,
                ),
              ),
              const SizedBox(width: 9),
              // Title
              Expanded(
                child: Text(
                  'Product',
                  style: AppTextStyles.kInterTextStyle16with600(
                    AppColor.pureWhite,
                  ).copyWith(fontSize: 18, height: 1.21),
                ),
              ),
              // Search Icon
              GestureDetector(
                onTap: () => controller.navigateToSearch(),
                child: Icon(Icons.search, color: AppColor.pureWhite, size: 24),
              ),
              const SizedBox(width: 16),
              // Filter Icon
              GestureDetector(
                onTap: () => controller.navigateToFilter(),
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
                      color: AppColor.homePrimary,
                      size: 20,
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

  Widget _buildProductImages() {
    return Container(
      height: 342,
      color: const Color(0xFFFCFCFC),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Main Image
          Center(
            child: Obx(
              () => Image.asset(
                controller.productImages.isNotEmpty
                    ? controller.productImages[controller
                          .selectedImageIndex
                          .value]
                    : 'assets/images/product_placeholder.png',
                width: 292,
                height: 292,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 292,
                    height: 292,
                    color: const Color(0xFFF4F4F4),
                    child: const Icon(Icons.image_not_supported, size: 100),
                  );
                },
              ),
            ),
          ),

          // Discount Badge
          Positioned(
            bottom: 0,
            right: 0,
            child: Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
                decoration: const BoxDecoration(
                  color: Color(0xFF0071A4),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
                ),
                child: Text(
                  '${controller.discount.value}% OFF',
                  style: AppTextStyles.kInterTextStyle14with600(
                    AppColor.pureWhite,
                  ).copyWith(height: 1.14),
                ),
              ),
            ),
          ),

          // Favorite Button (top right)
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Get.snackbar('Wishlist', 'Added to wishlist');
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFECA61B), width: 1),
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColor.pureBlack,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecifications() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.pureWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF4F4F4)),
      ),
      child: Obx(
        () => Column(
          children: List.generate(controller.specifications.length, (index) {
            final spec = controller.specifications[index];
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon
                    Container(
                      width: 29,
                      height: 29,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.info_outline,
                        size: 16,
                        color: Color(0xFF9D9EA2),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            spec['title'] ?? '',
                            style: AppTextStyles.kInterTextStyle12with400(
                              const Color(0xFF717378),
                            ).copyWith(height: 1.5, letterSpacing: 0.08),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            spec['description'] ?? '',
                            style: AppTextStyles.kInterTextStyle14with500(
                              const Color(0xFF060709),
                            ).copyWith(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (index < controller.specifications.length - 1)
                  const SizedBox(height: 20),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Obx(
      () => Column(
        children: [
          // Tab Headers
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFF4F4F4), width: 1),
              ),
            ),
            child: Row(
              children: [
                _buildTabButton('Description', 0),
                const SizedBox(width: 12),
                _buildTabButton('Reviews', 1),
                const SizedBox(width: 12),
                _buildTabButton('Specifications', 2),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Tab Content
          Text(
            controller.description.value,
            style: AppTextStyles.kInterTextStyle14with400(
              const Color(0xFF46494F),
            ).copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.selectTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            color: controller.selectedTab.value == index
                ? AppColor.pureWhite
                : AppColor.pureWhite,
            border: Border.all(
              color: controller.selectedTab.value == index
                  ? const Color(0xFF0071A4)
                  : const Color(0xFFF4F4F4),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            label,
            style: AppTextStyles.kInterTextStyle14with500(
              controller.selectedTab.value == index
                  ? const Color(0xFF1472B2)
                  : const Color(0xFF46494F),
            ).copyWith(height: 1.5),
          ),
        ),
      ),
    );
  }

  Widget _buildActionBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF4F4F4)),
      ),
      child: Column(
        children: [
          // Quantity and Stock
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFF4F4F4), width: 1),
              ),
            ),
            child: Row(
              children: [
                // Quantity Selector
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFF4F4F4)),
                  ),
                  child: Row(
                    children: [
                      // Decrease
                      GestureDetector(
                        onTap: () => controller.decreaseQuantity(),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColor.pureWhite,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(Icons.remove, size: 16),
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Quantity
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Obx(
                            () => Text(
                              '${controller.quantity.value}',
                              style: AppTextStyles.kInterTextStyle12with400(
                                AppColor.pureBlack,
                              ).copyWith(height: 1.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Increase
                      GestureDetector(
                        onTap: () => controller.increaseQuantity(),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColor.pureWhite,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(Icons.add, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 20,
                  color: const Color(0xFFF4F4F4),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                ),
                // In Stock
                Text(
                  'In Stock',
                  style: AppTextStyles.kInterTextStyle12with400(
                    const Color(0xFF17AF26),
                  ).copyWith(height: 1.5),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Buttons
          Row(
            children: [
              // Add to Cart
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.addToCart(),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0071A4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add to Cart',
                          style: AppTextStyles.kInterTextStyle14with600(
                            AppColor.pureWhite,
                          ).copyWith(height: 1.5),
                        ),
                        Container(
                          width: 1,
                          height: 12,
                          color: AppColor.pureWhite,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        Obx(
                          () => Text(
                            '₹${controller.discountedPrice.value}',
                            style: AppTextStyles.kInterTextStyle14with600(
                              AppColor.pureWhite,
                            ).copyWith(height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Buy Now
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.buyNow(),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFECA61B),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: AppTextStyles.kInterTextStyle14with600(
                          AppColor.pureWhite,
                        ).copyWith(height: 1.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBenefits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Safe On Benefits',
          style: AppTextStyles.kInterTextStyle14with600(
            const Color(0xFF46494F),
          ).copyWith(height: 1.5),
        ),
        const SizedBox(height: 12),
        _buildBenefitRow('GST Invoice Available'),
        const SizedBox(height: 12),
        _buildBenefitRow('Secure Payments'),
        const SizedBox(height: 12),
        _buildBenefitRow('365 Days Help Desk'),
      ],
    );
  }

  Widget _buildBenefitRow(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle_outline, size: 16, color: AppColor.homePrimary),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyles.kInterTextStyle14with500(
            const Color(0xFF46494F),
          ).copyWith(height: 1.5),
        ),
      ],
    );
  }

  Widget _buildRelatedProducts() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Related Product',
            style: AppTextStyles.kInterTextStyle16with600(
              const Color(0xFF202020),
            ).copyWith(fontSize: 21, height: 1.43, letterSpacing: -0.01),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.relatedProducts.length,
              separatorBuilder: (context, index) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final product = controller.relatedProducts[index];
                return _buildRelatedProductCard(product);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Get.snackbar('Product', 'Loading ${product['productName']}');
      },
      child: Container(
        width: 140,
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
            // Product Image
            Stack(
              children: [
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F3FC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      product['imageUrl'] ?? '',
                      width: 95,
                      height: 95,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, size: 40);
                      },
                    ),
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
                      '${product['discount']}% OFF',
                      style: AppTextStyles.kInterTextStyle14with600(
                        AppColor.pureWhite,
                      ).copyWith(height: 1.14),
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
                    product['productName'] ?? '',
                    style: AppTextStyles.kInterTextStyle14with500(
                      const Color(0xFF222222),
                    ).copyWith(height: 1.29),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Save - ₹${product['originalPrice'] - product['discountedPrice']}',
                        style: AppTextStyles.kInterTextStyle12with600(
                          const Color(0xFF249B3E),
                        ).copyWith(height: 1.5),
                      ),
                      Row(
                        children: [
                          Text(
                            '₹${product['discountedPrice']}',
                            style: AppTextStyles.kInterTextStyle12with700(
                              const Color(0xFF222222),
                            ).copyWith(height: 1.5),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '₹${product['originalPrice']}',
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
