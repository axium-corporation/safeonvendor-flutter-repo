import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/cart/cart_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/cart/widgets/cart_item_card.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Column(
        children: [
          // Header
          Container(
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
                      child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.pureWhite,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 21),
                    // Title
                    Text(
                      'Cart',
                      style: AppTextStyles.kInterTextStyle16with600(
                        AppColor.pureWhite,
                      ).copyWith(fontSize: 18, height: 1.2102272245619032),
                    ),
                    const Spacer(),
                    // Search Button
                    GestureDetector(
                      onTap: () {
                        // Handle search
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.search,
                          color: AppColor.pureWhite,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 23),
                    // Shop Button
                    GestureDetector(
                      onTap: () {
                        // Handle shop
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F9FB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColor.homePrimary,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.homePrimary),
                );
              }

              if (controller.cartItems.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 100,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Your cart is empty',
                        style: AppTextStyles.kInterTextStyle16with600(
                          AppColor.homeHeading,
                        ).copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Add items to get started',
                        style: AppTextStyles.kInterTextStyle14with400(
                          const Color(0xFF9D9EA2),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // Cart Items
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = controller.cartItems[index];
                            final itemId = item['id'] as int;

                            return Obx(
                              () => CartItemCard(
                                item: item,
                                isExpanded: controller.isExpanded(itemId),
                                onToggleExpand: () =>
                                    controller.toggleExpanded(itemId),
                                onDelete: () => controller.deleteItem(itemId),
                                onIncreaseQuantity: () =>
                                    controller.increaseQuantity(itemId),
                                onDecreaseQuantity: () =>
                                    controller.decreaseQuantity(itemId),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Price Details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price Details',
                            style: AppTextStyles.kInterTextStyle16with600(
                              const Color(0xFF1A1E26),
                            ).copyWith(height: 1.5),
                          ),

                          const SizedBox(height: 16),

                          Obx(
                            () => Column(
                              children: [
                                // Price
                                _buildPriceRow(
                                  'Price',
                                  '₹${controller.subtotal}',
                                  const Color(0xFF4F5663),
                                  const Color(0xFF061023),
                                ),

                                const SizedBox(height: 16),

                                // Discount
                                _buildPriceRow(
                                  'Discount (${controller.cartItems.isEmpty ? 0 : controller.cartItems[0]['discount']}%)',
                                  '-₹${controller.totalDiscount}',
                                  const Color(0xFF4F5663),
                                  const Color(0xFF249B3E),
                                ),

                                const SizedBox(height: 16),

                                // Shipping
                                _buildPriceRow(
                                  'Shipping Charges',
                                  controller.shippingCharges,
                                  const Color(0xFF4F5663),
                                  const Color(0xFF249B3E),
                                ),

                                const SizedBox(height: 16),

                                // Divider
                                Container(
                                  height: 1,
                                  color: const Color(0xFFE2E2E2),
                                ),

                                const SizedBox(height: 16),

                                // Total
                                _buildPriceRow(
                                  'Total Amount',
                                  '₹${controller.grandTotal}',
                                  const Color(0xFF4F5663),
                                  const Color(0xFF061023),
                                  isBold: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Checkout Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: controller.proceedToCheckout,
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColor.homePrimary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Checkout',
                                style: AppTextStyles.kInterTextStyle14with600(
                                  const Color(0xFFFAFBFC),
                                ).copyWith(height: 1.5),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                color: const Color(0xFFFAFBFC),
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Installation Service Banner
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Are you looking for installation \nServices?',
                              style: AppTextStyles.kInterTextStyle16with600(
                                const Color(0xFF1A1E26),
                              ).copyWith(height: 1.5),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              'Installation service ensures your property\'s safety with precision and expertise',
                              style: AppTextStyles.kInterTextStyle14with400(
                                const Color(0xFF717378),
                              ).copyWith(height: 1.5),
                            ),

                            const SizedBox(height: 17),

                            GestureDetector(
                              onTap: controller.enquireInstallation,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.homePrimary,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.help_outline,
                                      size: 16,
                                      color: AppColor.pureWhite,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Enquire Now',
                                      style:
                                          AppTextStyles.kInterTextStyle12with600(
                                            AppColor.pureWhite,
                                          ).copyWith(
                                            height: 1.2102272510528564,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 120),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    String value,
    Color labelColor,
    Color valueColor, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.kInterTextStyle14with400(labelColor).copyWith(
            height: 1.5,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style:
              (isBold
                      ? AppTextStyles.kInterTextStyle14with600(valueColor)
                      : AppTextStyles.kInterTextStyle14with400(valueColor))
                  .copyWith(height: 1.5),
        ),
      ],
    );
  }
}
