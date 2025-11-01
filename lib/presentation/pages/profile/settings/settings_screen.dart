import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Bar
            SafeArea(
              bottom: false,
              child: const SizedBox(height: 30),
            ),

            // Title Section
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 0, bottom: 7),
              child: Text(
                'Settings',
                style: AppTextStyles.kInterTextStyle14with600(
                  const Color(0xFF202020),
                ).copyWith(
                  fontSize: 28,
                  height: 1.2857142857142858,
                  letterSpacing: -0.28,
                ),
              ),
            ),

            // Your Profile Text
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 18),
              child: Text(
                'Your Profile',
                style: AppTextStyles.kInterTextStyle14with500(
                  AppColor.pureBlack,
                ).copyWith(
                  fontSize: 16,
                  height: 1.25,
                  letterSpacing: -0.16,
                ),
              ),
            ),

            // Profile Image
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Stack(
                children: [
                  // Profile Circle
                  Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.pureWhite,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.16),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile/avatar.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ),

                  // Edit Button
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: controller.editProfileImage,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.homePrimary,
                          border: Border.all(color: AppColor.pureWhite, width: 2),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 13.5,
                          color: AppColor.pureWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Form Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildTextField(
                    controller: controller.nameController,
                    readOnly: false,
                  ),
                  const SizedBox(height: 13),
                  _buildTextField(
                    controller: controller.phoneController,
                    readOnly: false,
                  ),
                  const SizedBox(height: 13),
                  _buildTextField(
                    controller: controller.emailController,
                    readOnly: false,
                  ),
                  const SizedBox(height: 13),
                  _buildTextField(
                    controller: controller.passwordController,
                    readOnly: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 29),

            // Save Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: controller.saveChanges,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColor.homePrimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Save Changes',
                    style: AppTextStyles.kInterTextStyle14with600(
                      const Color(0xFFFAFBFC),
                    ).copyWith(height: 1.5),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required bool readOnly,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4FE),
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        style: AppTextStyles.kInterTextStyle14with400(
          AppColor.pureBlack,
        ).copyWith(
          height: 1.5,
          letterSpacing: -0.17,
        ),
      ),
    );
  }
}

