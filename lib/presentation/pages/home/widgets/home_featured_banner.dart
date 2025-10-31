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
          // Banner Container
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.homeBannerRed,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Stack(
              children: [
                // Background Bubbles
                Positioned(
                  left: -22.88,
                  bottom: -65.57,
                  child: Opacity(
                    opacity: 0.7,
                    child: Container(
                      width: 171.32,
                      height: 160.39,
                      decoration: const BoxDecoration(
                        color: AppColor.homeYellow1,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -61,
                  top: -27,
                  child: Container(
                    width: 268.13,
                    height: 245.95,
                    decoration: const BoxDecoration(
                      color: AppColor.homeYellow2,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  right: -78.44,
                  bottom: -40.32,
                  child: Opacity(
                    opacity: 0.7,
                    child: Container(
                      width: 136.44,
                      height: 149.91,
                      decoration: const BoxDecoration(
                        color: AppColor.homeYellow3,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                // Content
                Positioned(
                  left: 38,
                  top: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fire Fighting',
                        style: AppTextStyles.kInterTextStyle24with700(
                          AppColor.pureWhite,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        'Up to 70%',
                        style: AppTextStyles.kNunitoSansTextStyle12with700(
                          AppColor.pureWhite,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pipe Nozzle',
                        style: AppTextStyles.kInterTextStyle11with700(
                          AppColor.homeBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                // Product Image
                Positioned(
                  right: 20,
                  top: -4,
                  child: Image.asset(
                    'assets/images/fire_nozzle.png',
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
              ],
            ),
          ),
          // Carousel Indicators
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    width: index == controller.currentBannerIndex.value
                        ? 34
                        : 8.5,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4.25),
                    decoration: BoxDecoration(
                      color: index == controller.currentBannerIndex.value
                          ? AppColor.pureWhite
                          : AppColor.homeBlue,
                      borderRadius: BorderRadius.circular(4),
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
