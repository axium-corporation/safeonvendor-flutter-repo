import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/main_controller.dart';

class CustomBottomNavigation extends GetView<MainController> {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.pureWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF555E58).withValues(alpha: 0.09),
            offset: const Offset(2, -5),
            blurRadius: 15,
          ),
          BoxShadow(
            color: const Color(0xFFE6EBF3).withValues(alpha: 0.5),
            offset: const Offset(0, -12),
            blurRadius: 37,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 23),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BottomNavItem(
                  icon: Icons.home,
                  label: 'Home',
                  isActive: controller.currentIndex.value == 0,
                  onTap: () => controller.changeTab(0),
                  hasNotification: false,
                ),
                _BottomNavItem(
                  icon: Icons.view_list,
                  label: 'Categories',
                  isActive: controller.currentIndex.value == 1,
                  onTap: () => controller.changeTab(1),
                  hasNotification: false,
                ),
                _BottomNavItem(
                  icon: Icons.explore_outlined,
                  label: 'Explore',
                  isActive: controller.currentIndex.value == 2,
                  onTap: () => controller.changeTab(2),
                  hasNotification: false,
                ),
                _BottomNavItem(
                  icon: Icons.person_outline,
                  label: 'Account',
                  isActive: controller.currentIndex.value == 3,
                  onTap: () => controller.changeTab(3),
                  hasNotification: false,
                ),
                _BottomNavItem(
                  icon: Icons.shopping_cart_outlined,
                  label: 'Cart',
                  isActive: controller.currentIndex.value == 4,
                  onTap: () => controller.changeTab(4),
                  hasNotification: true,
                  notificationCount: 2,
                ),
              ],
            );
          }),
          const SizedBox(height: 15),
          // Home Indicator
          Container(
            height: 5,
            width: 148,
            margin: const EdgeInsets.only(bottom: 21),
            decoration: BoxDecoration(
              color: const Color(0xFF878787),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final bool hasNotification;
  final int notificationCount;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.hasNotification = false,
    this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: isActive
                      ? AppColor.homeBottomNavActive
                      : AppColor.homeBottomNavInactive,
                ),
                if (hasNotification)
                  Positioned(
                    right: -4,
                    top: -4,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        color: AppColor.homeBadgeRed,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          notificationCount.toString(),
                          style: AppTextStyles.kInterTextStyle12with600(
                            AppColor.pureWhite,
                          ).copyWith(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.kInterTextStyle12with600(
                isActive
                    ? AppColor.homeBottomNavActive
                    : AppColor.homeBottomNavInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
