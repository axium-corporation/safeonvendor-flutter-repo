import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/orders_controller.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhite,
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
                      'Your Orders',
                      style: AppTextStyles.kInterTextStyle16with600(
                        AppColor.pureWhite,
                      ).copyWith(fontSize: 18, height: 1.2102272245619032),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Orders List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.homePrimary),
                );
              }

              if (controller.orders.isEmpty) {
                return Center(
                  child: Text(
                    'No orders found',
                    style: AppTextStyles.kInterTextStyle16with400(
                      const Color(0xFF999999),
                    ),
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  top: 13,
                  bottom: 120,
                ),
                itemCount: controller.orders.length,
                separatorBuilder: (context, index) => const SizedBox(height: 13),
                itemBuilder: (context, index) {
                  final order = controller.orders[index];
                  return _buildOrderCard(order);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Container(
      height: 102,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.pureWhite,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColor.pureBlack.withValues(alpha: 0.05),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 13,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 55,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                order['imageUrl'] ?? '',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 24);
                },
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Order Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Message
                Text(
                  order['message'] ?? '',
                  style: AppTextStyles.kInterTextStyle14with400(
                    const Color(0xFF23303B),
                  ).copyWith(height: 1.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                // Rating
                Row(
                  children: List.generate(5, (index) {
                    final rating = order['rating'] ?? 0;
                    return Icon(
                      Icons.star,
                      size: 12.77,
                      color: index < rating.floor()
                          ? const Color(0xFFECA61B)
                          : const Color(0xFFC9C9C8),
                    );
                  }),
                ),

                // Time
                Text(
                  order['time'] ?? '',
                  style: AppTextStyles.kInterTextStyle12with400(
                    const Color(0xFF999999),
                  ).copyWith(height: 1.75),
                ),
              ],
            ),
          ),

          // Arrow
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: AppColor.pureBlack,
          ),
        ],
      ),
    );
  }
}

