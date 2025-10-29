import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/auth/auth_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';

class OtpScreen extends GetView<AuthController> {
  const OtpScreen({super.key});

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
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Column(
                    children: [
                      const SizedBox(height: 88),
                      // Title and Description
                      _buildTitleSection(),
                      const SizedBox(height: 79),
                      // OTP Input Fields
                      _buildOtpInputs(),
                      const SizedBox(height: 27),
                      // Resend OTP
                      _buildResendOtp(),
                      const SizedBox(height: 17),
                      // Create Account Button
                      _buildCreateAccountButton(),
                      const SizedBox(height: 32),
                      // Terms Text
                      _buildTermsText(),
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

  Widget _buildTitleSection() {
    return Column(
      children: [
        Text(
          'Verify Mobile Number',
          style: AppTextStyles.kInterTextStyle26with600(AppColor.pureBlack),
        ),
        const SizedBox(height: 15),
        Text(
          'A text with a one-time password has been\nsent to your cellphone number and \nemail address.',
          textAlign: TextAlign.center,
          style: AppTextStyles.kInterTextStyle14with400(AppColor.pureBlack),
        ),
        const SizedBox(height: 51),
        TextButton(
          onPressed: () {
            // Handle change mobile number
          },
          child: Text(
            'Change mobile number',
            style: AppTextStyles.kInterTextStyle15with600(
              AppColor.authPrimaryAlt,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOtpInputs() {
    return Column(
      children: [
        Text(
          'Enter Mobile OTP',
          style: AppTextStyles.kPoppinsTextStyle15with500(AppColor.pureBlack),
        ),
        const SizedBox(height: 13),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (index) {
            return Container(
              width: 44,
              height: 50,
              margin: EdgeInsets.only(right: index < 5 ? 16 : 0),
              decoration: BoxDecoration(
                color: AppColor.gray50,
                border: Border.all(color: AppColor.gray300, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextField(
                controller: controller.otpControllers[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
                style: AppTextStyles.kInterTextStyle16with400(
                  AppColor.pureBlack,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildResendOtp() {
    return TextButton(
      onPressed: () {
        // Handle resend OTP
      },
      child: Text(
        'Resend OTP',
        style: AppTextStyles.kInterTextStyle15with500(AppColor.authPrimaryAlt),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
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
          // Handle OTP verification and navigate to home
          // For now, navigate back to login
          Get.offAllNamed(Routes.loginScreenRoute);
        },
        child: Text(
          'Create your safeon account',
          style: AppTextStyles.kInterTextStyle16with600(AppColor.pureWhite),
        ),
      ),
    );
  }

  Widget _buildTermsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37),
      child: Text(
        "By creating an account you agree to Safeon's\nTerms and Conditions and Privacy Policy",
        textAlign: TextAlign.center,
        style: AppTextStyles.kRobotoFlexTextStyle12with600(AppColor.pureBlack),
      ),
    );
  }
}
