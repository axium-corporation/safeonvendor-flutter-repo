import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/notifications_controller.dart';

class NotificationsScreen extends GetView<NotificationsController> {
  const NotificationsScreen({super.key});

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
                    const SizedBox(width: 9),
                    // Title
                    Obx(
                      () => Text(
                        'Notifiations (${controller.notifications.length})',
                        style: AppTextStyles.kInterTextStyle16with600(
                          AppColor.pureWhite,
                        ).copyWith(fontSize: 18, height: 1.2102272245619032),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tabs
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => _buildTab('Orders', 0)),
                const SizedBox(width: 31),
                Obx(() => _buildTab('Offers', 1)),
              ],
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.only(left: 26, bottom: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Today',
                style:
                    AppTextStyles.kInterTextStyle16with600(
                      const Color(0xFF23303B),
                    ).copyWith(
                      fontSize: 18,
                      height: 1.2102272245619032,
                      letterSpacing: -0.03,
                    ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: Obx(() {
              if (controller.selectedTab.value == 1) {
                // Offers tab - empty state
                return Center(
                  child: Text(
                    'No offers found',
                    style: AppTextStyles.kInterTextStyle16with400(
                      const Color(0xFF999999),
                    ),
                  ),
                );
              }

              // Orders tab
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.homePrimary),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.only(
                  left: 28,
                  right: 28,
                  bottom: 120,
                ),
                itemCount: controller.notifications.length,
                separatorBuilder: (context, index) => const SizedBox(height: 7),
                itemBuilder: (context, index) {
                  final notification = controller.notifications[index];
                  return _buildNotificationCard(notification);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int tabIndex) {
    final isSelected = controller.selectedTab.value == tabIndex;
    return GestureDetector(
      onTap: () => controller.changeTab(tabIndex),
      child: Container(
        width: 79,
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF7FBDE7) : AppColor.pureWhite,
          border: Border.all(color: AppColor.homePrimary, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: AppTextStyles.kInterTextStyle14with400(
            AppColor.pureBlack,
          ).copyWith(height: 1.2102272851126534),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification) {
    return Container(
      height: 82,
      decoration: BoxDecoration(
        color: AppColor.pureWhite,
        border: Border.all(
          color: AppColor.pureBlack.withValues(alpha: 0.05),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
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
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                notification['imageUrl'] ?? '',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 24);
                },
              ),
            ),
          ),

          // Notification Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notification['message'] ?? '',
                    style: AppTextStyles.kInterTextStyle14with400(
                      const Color(0xFF23303B),
                    ).copyWith(height: 1.5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    notification['time'] ?? '',
                    style: AppTextStyles.kInterTextStyle12with400(
                      const Color(0xFF999999),
                    ).copyWith(height: 1.75),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
