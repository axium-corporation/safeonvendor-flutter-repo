import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/home/home_controller.dart';

class HomeFeaturedBanner extends GetView<HomeController> {
  const HomeFeaturedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          // Banner Container with enhanced shadows - Animated background
          Obx(() {
            final currentIndex = controller.currentBannerIndex.value;
            // Create different background colors for each banner
            final backgroundColors = [
              AppColor.homeBannerRed,
              const Color(0xFFE63946), // Red variant
              const Color(0xFFF77F00), // Orange
              const Color(0xFF06A77D), // Green
              const Color(0xFF4361EE), // Blue
            ];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColors[currentIndex % backgroundColors.length],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColors[currentIndex % backgroundColors.length]
                        .withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Background Bubbles - Animated positions and opacity
                  Obx(() {
                    final index = controller.currentBannerIndex.value;
                    final animationOffset = (index * 20.0) % 40.0;
                    return Positioned(
                      left: -22.88 + (animationOffset * 0.5),
                      bottom: -65.57 + (animationOffset * 0.3),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 600),
                        opacity: 0.7 + (0.3 * (index % 3) / 3),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                          width: 171.32 + (animationOffset * 0.2),
                          height: 160.39 + (animationOffset * 0.2),
                          decoration: BoxDecoration(
                            color: AppColor.homeYellow1.withOpacity(
                              0.8 + (0.2 * (index % 2)),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    final index = controller.currentBannerIndex.value;
                    final animationOffset = (index * 25.0) % 50.0;
                    return Positioned(
                      right: -61 - (animationOffset * 0.3),
                      top: -27 - (animationOffset * 0.2),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        width: 268.13 - (animationOffset * 0.15),
                        height: 245.95 - (animationOffset * 0.15),
                        decoration: BoxDecoration(
                          color: AppColor.homeYellow2.withOpacity(
                            0.9 - (0.2 * (index % 3) / 3),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    final index = controller.currentBannerIndex.value;
                    final animationOffset = (index * 15.0) % 30.0;
                    return Positioned(
                      right: -78.44 - (animationOffset * 0.4),
                      bottom: -40.32 - (animationOffset * 0.3),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 600),
                        opacity: 0.7 + (0.2 * (index % 2)),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                          width: 136.44 + (animationOffset * 0.25),
                          height: 149.91 + (animationOffset * 0.25),
                          decoration: BoxDecoration(
                            color: AppColor.homeYellow3.withOpacity(
                              0.75 + (0.25 * (index % 3) / 3),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  }),
                // Content - Dynamic based on current banner index with transitions
                Obx(() {
                  final currentIndex = controller.currentBannerIndex.value;
                  final banner = controller.banners[currentIndex];
                  return Positioned(
                    left: 38,
                    top: 12,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 0.3),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutCubic,
                              ),
                            ),
                            child: child,
                          ),
                        );
                      },
                      child: Column(
                        key: ValueKey<int>(currentIndex),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            banner['title'] ?? 'Fire Fighting',
                            style: AppTextStyles.kInterTextStyle24with700(
                              AppColor.pureWhite,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            banner['subtitle'] ?? 'Up to 70%',
                            style: AppTextStyles.kNunitoSansTextStyle12with700(
                              AppColor.pureWhite,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            banner['buttonText'] ?? 'Pipe Nozzle',
                            style: AppTextStyles.kInterTextStyle11with700(
                              AppColor.homeBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                // Product Image - Dynamic based on current banner index with transitions
                Obx(() {
                  final currentIndex = controller.currentBannerIndex.value;
                  final banner = controller.banners[currentIndex];
                  return Positioned(
                    right: 20,
                    top: -4,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.8,
                              end: 1.0,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutCubic,
                              ),
                            ),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.3, 0.0),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOutCubic,
                                ),
                              ),
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        key: ValueKey<String>(banner['imageUrl'] ?? ''),
                        banner['imageUrl'] ?? 'assets/images/fire_nozzle.png',
                        height: 146.46,
                        width: 146.46,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 146.46,
                            width: 146.46,
                            color: Colors.transparent,
                          );
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
            );
          }),
          // Carousel Indicators with smooth animations
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(controller.banners.length, (index) {
                  final isActive = index == controller.currentBannerIndex.value;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: isActive ? 34 : 8.5,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4.25),
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColor.pureWhite
                          : AppColor.homeBlue.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ]
                          : null,
                    ),
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
  }
}
