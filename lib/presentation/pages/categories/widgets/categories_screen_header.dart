import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';

class CategoriesScreenHeader extends StatelessWidget {
  const CategoriesScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Expanded(
                child: Text(
                  'Category',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.kInterTextStyle16with600(
                    AppColor.pureWhite,
                  ).copyWith(
                    fontSize: 18,
                    height: 1.2102272245619032,
                  ),
                ),
              ),
              // Search Button
              GestureDetector(
                onTap: () {
                  // Handle search tap
                },
                child: Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.search,
                    color: AppColor.pureWhite,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 17),
              // Filter/Shop Button
              GestureDetector(
                onTap: () {
                  // Handle filter tap
                },
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColor.homeLightBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColor.homePrimary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

