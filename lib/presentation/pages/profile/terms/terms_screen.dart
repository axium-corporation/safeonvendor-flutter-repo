import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/terms_controller.dart';

class TermsScreen extends GetView<TermsController> {
  const TermsScreen({super.key});

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
                      'Terms and Conditions',
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
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 60, bottom: 120),
              itemCount: controller.termsItems.length,
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: AppColor.pureBlack.withValues(alpha: 0.1),
              ),
              itemBuilder: (context, index) {
                final item = controller.termsItems[index];
                return GestureDetector(
                  onTap: () => controller.navigateToDetail(item['title'] ?? ''),
                  child: Container(
                    height: 42.5,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['title'] ?? '',
                          style: AppTextStyles.kInterTextStyle16with400(
                            AppColor.pureBlack,
                          ).copyWith(height: 1.2102272510528564),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColor.pureBlack,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

