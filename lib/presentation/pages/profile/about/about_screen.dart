import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/about_controller.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({super.key});

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
                    Text(
                      'About Us',
                      style: AppTextStyles.kInterTextStyle16with600(
                        AppColor.pureWhite,
                      ).copyWith(
                        fontSize: 18,
                        height: 1.2102272245619032,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 41),

                  // About Text
                  Text(
                    controller.aboutText,
                    style: AppTextStyles.kInterTextStyle14with400(
                      AppColor.pureBlack,
                    ).copyWith(
                      height: 2.142857142857143,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 30),

                  // Features Section
                  Container(
                    padding: const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFDFF2FF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildFeatureItem(
                          icon: Icons.verified_outlined,
                          label: 'Original\nProducts',
                        ),
                        _buildFeatureItem(
                          icon: Icons.lock_outline,
                          label: 'Secure\nPayment',
                        ),
                        _buildFeatureItem(
                          icon: Icons.shield_outlined,
                          label: '100% Buyer\nProduction',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 38),

                  // Copyright
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.homePrimary,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'c',
                              style: AppTextStyles.kInterTextStyle12with400(
                                AppColor.homePrimary,
                              ).copyWith(
                                fontSize: 8,
                                height: 1.3333333333333333,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '2024 Safeon.com',
                          style: AppTextStyles.kInterTextStyle12with400(
                            AppColor.homePrimary,
                          ).copyWith(height: 1.3333333333333333),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(
            icon,
            size: 23,
            color: const Color(0xFF828282),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: AppTextStyles.kInterTextStyle12with400(
              AppColor.pureBlack,
            ).copyWith(height: 1.3333333333333333),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

