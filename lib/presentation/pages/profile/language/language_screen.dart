import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/language_controller.dart';

class LanguageScreen extends GetView<LanguageSelectionController> {
  const LanguageScreen({super.key});

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
                    const SizedBox(width: 8),
                    // Title
                    Text(
                      'Languages',
                      style: AppTextStyles.kInterTextStyle16with600(
                        AppColor.pureWhite,
                      ).copyWith(fontSize: 18, height: 1.2102272245619032),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Languages List
          Expanded(
            child: Obx(
              () => ListView.separated(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 19,
                  bottom: 120,
                ),
                itemCount: controller.languages.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final language = controller.languages[index];
                  final isSelected =
                      controller.selectedLanguage.value == language;
                  return _buildLanguageItem(language, isSelected);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(String language, bool isSelected) {
    return GestureDetector(
      onTap: () => controller.selectLanguage(language),
      child: Container(
        height: 42.5,
        decoration: BoxDecoration(
          color: AppColor.pureWhite,
          border: Border(
            bottom: BorderSide(
              color: AppColor.pureBlack.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            // Radio Button
            Container(
              width: 19,
              height: 19,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColor.homePrimary
                      : const Color(0xFF95989A),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.homePrimary,
                        ),
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 19.5),

            // Language Name
            Text(
              language,
              style: AppTextStyles.kInterTextStyle16with400(
                AppColor.pureBlack,
              ).copyWith(height: 1.2102272510528564),
            ),

            const Spacer(),

            // Arrow
            Icon(Icons.arrow_forward_ios, size: 20, color: AppColor.pureBlack),
          ],
        ),
      ),
    );
  }
}
