import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/auth/auth_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';
import 'package:safeonvendor_flutter_repo/presentation/widgets/text_form_field.dart';

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.authPrimaryAlt,
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar
            _buildStatusBar(),
            // Logo
            _buildLogo(),
            // White Container
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.pureWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 17),
                      // Title
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text(
                          'Create New Account',
                          style: AppTextStyles.kInterTextStyle26with600(
                            AppColor.pureBlack,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      // Name Input
                      CustomTextFeild(
                        label: '',
                        controller: TextEditingController(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        maxLEngth: null,
                        hint: 'Name',
                        fillColor: AppColor.gray50,
                        borderColor: AppColor.gray300,
                        borderRadius: 6,
                        paddingReduces: true,
                        autoValidate: false,
                      ),
                      const SizedBox(height: 10),
                      // Email Input
                      CustomTextFeild(
                        label: '',
                        controller: TextEditingController(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        maxLEngth: null,
                        hint: 'Email',
                        fillColor: AppColor.gray50,
                        borderColor: AppColor.gray300,
                        borderRadius: 6,
                        paddingReduces: true,
                        autoValidate: false,
                      ),
                      const SizedBox(height: 10),
                      // Mobile Number Input
                      _buildMobileNumberField(),
                      const SizedBox(height: 10),
                      // Password Info Text
                      _buildPasswordInfo(),
                      const SizedBox(height: 40),
                      // Verify Button
                      _buildVerifyButton(),
                      const SizedBox(height: 80),
                      // Sign In Link
                      _buildSignInLink(),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColor.pureWhite,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.signal_cellular_alt,
                size: 18,
                color: AppColor.pureWhite,
              ),
              const SizedBox(width: 3),
              Icon(Icons.wifi, size: 15, color: AppColor.pureWhite),
              const SizedBox(width: 5),
              Icon(Icons.battery_full, size: 27, color: AppColor.pureWhite),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 58, bottom: 48),
      child: Image.asset('assets/images/logo.png', width: 192, height: 62),
    );
  }

  Widget _buildMobileNumberField() {
    return Row(
      children: [
        // Country Code Selector
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          decoration: BoxDecoration(
            color: AppColor.pureWhite,
            border: Border.all(color: AppColor.gray300, width: 1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '+91',
                style: AppTextStyles.kInterTextStyle16with400(AppColor.gray500),
              ),
              const SizedBox(width: 4),
              Icon(TablerIcons.chevron_down, size: 16, color: AppColor.gray400),
            ],
          ),
        ),
        // Mobile Number Input
        Expanded(
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            decoration: BoxDecoration(
              color: AppColor.gray50,
              border: Border.all(color: AppColor.gray300, width: 1),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: TextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Mobile number',
                hintStyle: AppTextStyles.kInterTextStyle16with400(
                  AppColor.gray500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password must be at least 6 characters',
          style: AppTextStyles.kInterTextStyle14with400(AppColor.pureBlack),
        ),
        const SizedBox(height: 16),
        Text(
          'To validate your number and email address, we will send you a text message with an otp message. Data rates may apply.',
          style: AppTextStyles.kInterTextStyle14with400(AppColor.pureBlack),
        ),
      ],
    );
  }

  Widget _buildVerifyButton() {
    return Container(
      width: 332,
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.authPrimary,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColor.gray300, width: 1),
      ),
      child: TextButton(
        onPressed: () {
          Get.toNamed(Routes.otpScreenRoute);
        },
        child: Text(
          'Verify mobile number',
          style: AppTextStyles.kInterTextStyle16with600(AppColor.pureWhite),
        ),
      ),
    );
  }

  Widget _buildSignInLink() {
    return Center(
      child: TextButton(
        onPressed: () {
          Get.toNamed(Routes.loginScreenRoute);
        },
        child: Text(
          'Already have an account? sign in',
          style: AppTextStyles.kRobotoFlexTextStyle15with600(
            AppColor.pureBlack,
          ),
        ),
      ),
    );
  }
}
