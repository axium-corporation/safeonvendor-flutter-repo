import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/profile_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/profile/widgets/profile_menu_tile.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                // Settings Title
                Text(
                  'Settings',
                  style:
                      AppTextStyles.kInterTextStyle26with600(
                        AppColor.homeHeading,
                      ).copyWith(
                        fontSize: 28,
                        height: 1.2857142857142858,
                        letterSpacing: -0.28,
                      ),
                ),

                const SizedBox(height: 37),

                // Personal Section
                Text(
                  'Personal',
                  style: AppTextStyles.kInterTextStyle16with600(
                    AppColor.homeHeading,
                  ).copyWith(fontSize: 20, height: 1.2102272033691406),
                ),

                const SizedBox(height: 20),

                // Profile
                ProfileMenuTile(
                  title: 'Profile',
                  onTap: controller.navigateToProfile,
                ),

                const SizedBox(height: 16.5),

                // Your Orders
                ProfileMenuTile(
                  title: 'Your Orders',
                  onTap: controller.navigateToOrders,
                ),

                const SizedBox(height: 16.5),

                // Your Address
                ProfileMenuTile(
                  title: 'Your Address',
                  onTap: controller.navigateToAddress,
                ),

                const SizedBox(height: 16.5),

                // Payment methods
                ProfileMenuTile(
                  title: 'Payment methods',
                  onTap: controller.navigateToPaymentMethods,
                ),

                const SizedBox(height: 16.5),

                // Notification
                ProfileMenuTile(
                  title: 'Notification',
                  onTap: controller.navigateToNotifications,
                ),

                const SizedBox(height: 16.5),

                // My Wishlist
                ProfileMenuTile(
                  title: 'My Wishlist',
                  onTap: controller.navigateToWishlist,
                ),

                const SizedBox(height: 40),

                // About Section
                Text(
                  'About',
                  style: AppTextStyles.kInterTextStyle16with600(
                    AppColor.homeHeading,
                  ).copyWith(fontSize: 20, height: 1.2102272033691406),
                ),

                const SizedBox(height: 20),

                // Country
                Obx(
                  () => ProfileMenuTile(
                    title: 'Country',
                    trailing: controller.userCountry.value,
                    onTap: controller.navigateToCountry,
                  ),
                ),

                const SizedBox(height: 16.5),

                // Language
                Obx(
                  () => ProfileMenuTile(
                    title: 'Language',
                    trailing: controller.userLanguage.value,
                    onTap: controller.navigateToLanguage,
                  ),
                ),

                const SizedBox(height: 16.5),

                // Terms and Conditions
                ProfileMenuTile(
                  title: 'Terms and Conditions',
                  onTap: controller.navigateToTerms,
                ),

                const SizedBox(height: 16.5),

                // About Safe On
                ProfileMenuTile(
                  title: 'About Safe On',
                  onTap: controller.navigateToAbout,
                  showDivider: false,
                ),

                const SizedBox(height: 35.5),

                // Action Buttons
                Row(
                  children: [
                    // Delete Button
                    Expanded(
                      child: GestureDetector(
                        onTap: controller.deleteAccount,
                        child: Container(
                          height: 49,
                          decoration: BoxDecoration(
                            color: AppColor.pureWhite,
                            border: Border.all(
                              color: const Color(0xFFC60000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete_outline,
                                size: 21,
                                color: const Color(0xFFC60000),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Delete',
                                style: AppTextStyles.kInterTextStyle14with500(
                                  const Color(0xFFC60000),
                                ).copyWith(height: 1.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 21),

                    // Log Out Button
                    Expanded(
                      child: GestureDetector(
                        onTap: controller.logout,
                        child: Container(
                          height: 49,
                          decoration: BoxDecoration(
                            color: AppColor.pureWhite,
                            border: Border.all(
                              color: const Color(0xFF1472B2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                size: 14,
                                color: AppColor.homePrimary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Log Out',
                                style: AppTextStyles.kInterTextStyle14with500(
                                  AppColor.homePrimary,
                                ).copyWith(height: 1.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
