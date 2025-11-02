import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/home/home_controller.dart';

class HomeScreenHeader extends GetView<HomeController> {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.homePrimary,
      child: Column(
        children: [
          // Top Bar with Logo and Notification
          Padding(
            padding: EdgeInsets.fromLTRB(
              31,
              MediaQuery.of(context).padding.top + 13,
              27,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo with fade-in animation
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 400),
                  tween: Tween(begin: 0.0, end: 1.0),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 36,
                        width: 110,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 36,
                            width: 110,
                            color: AppColor.pureWhite,
                            child: const Center(
                              child: Text('SAFEON'),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                // Notification Badge with fade-in animation
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 400),
                  tween: Tween(begin: 0.0, end: 1.0),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: 0.8 + (0.2 * value),
                      child: Opacity(
                        opacity: value,
                        child: GestureDetector(
                          onTap: () {
                            // Handle notification tap
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: AppColor.homeLightBlue,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.notifications_outlined,
                                  size: 20,
                                  color: AppColor.homePrimary,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    color: AppColor.homeBadgeRed,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: AppTextStyles.kInterTextStyle12with600(
                                        AppColor.pureWhite,
                                      ).copyWith(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 19),
          // Search Bar with fade-in animation and enhanced styling
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 500),
              tween: Tween(begin: 0.0, end: 1.0),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, 10 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppColor.homeSearchBg,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10.27),
                          const Icon(
                            Icons.search,
                            size: 18,
                            color: AppColor.homeHeading,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              style: AppTextStyles.kInterTextStyle14with400(
                                AppColor.homeTextGray,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search Product, Category...',
                                hintStyle: AppTextStyles.kInterTextStyle14with400(
                                  AppColor.homeTextGray,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),
                            ),
                          ),
                          Container(
                            width: 23.72,
                            height: 16,
                            margin: const EdgeInsets.only(right: 10.33),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.homePrimary,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Icon(
                              Icons.filter_list,
                              size: 12,
                              color: AppColor.homePrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

