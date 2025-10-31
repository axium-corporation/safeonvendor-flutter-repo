import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.authPrimaryAlt,
              AppColor.authPrimaryAlt.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 80),
            // Animated Logo Section
            _buildAnimatedLogoSection(),
            // Animated White Container
            Expanded(
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 800),
                tween: Tween(begin: 1.0, end: 0.0),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, 50 * value),
                    child: Opacity(opacity: 1 - value, child: _buildOtpCard()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedLogoSection() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 48),
              child: Image.asset(
                'assets/images/logo.png',
                width: 192,
                height: 62,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOtpCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.pureWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  // Animated Title Section
                  _buildAnimatedTitleSection(),
                  const SizedBox(height: 50),
                  // Animated OTP Input Fields
                  _buildAnimatedOtpInputs(),
                  const SizedBox(height: 20),
                  // Animated Resend OTP
                  _buildAnimatedResendOtp(),
                  const SizedBox(height: 20),
                  // Animated Create Account Button
                  _buildAnimatedCreateAccountButton(),
                  const SizedBox(height: 40),
                  // Animated Terms Text
                  _buildAnimatedTermsText(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedTitleSection() {
    return Column(
      children: [
        // Animated Title
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 600),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, 30 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: Text(
                  'Verify Mobile Number',
                  style: AppTextStyles.kInterTextStyle26with600(
                    AppColor.pureBlack,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 15),
        // Animated Description
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 700),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Text(
                'A text with a one-time password has been\nsent to your cellphone number and \nemail address.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 30),
        // Animated Change Mobile Number Link
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 800),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  'Change mobile number',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColor.authPrimary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAnimatedOtpInputs() {
    return Column(
      children: [
        // Animated OTP Label
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 900),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Text(
                'Enter Mobile OTP',
                style: AppTextStyles.kPoppinsTextStyle15with500(
                  AppColor.pureBlack,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        // Animated OTP Input Boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (index) {
            return TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 1000 + (index * 50)),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: 0.8 + (0.2 * value),
                  child: Opacity(
                    opacity: value,
                    child: Container(
                      width: 48,
                      height: 56,
                      margin: EdgeInsets.only(right: index < 5 ? 12 : 0),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        border: Border.all(color: Colors.grey[200]!, width: 1),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
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
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAnimatedResendOtp() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1100),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: GestureDetector(
            onTap: () {
              // Handle resend OTP
            },
            child: Text(
              'Resend OTP',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColor.authPrimary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedCreateAccountButton() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1200),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.authPrimary,
                    AppColor.authPrimary.withValues(alpha: 0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.authPrimary.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Handle OTP verification and navigate to home
                    // For now, navigate back to login
                    Get.offAllNamed(Routes.loginScreenRoute);
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Center(
                    child: Text(
                      'Create your safeon account',
                      style: AppTextStyles.kInterTextStyle16with600(
                        AppColor.pureWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedTermsText() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1300),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
                children: [
                  const TextSpan(text: "By creating an account you agree to "),
                  TextSpan(
                    text: "Safeon's Terms and Conditions",
                    style: TextStyle(
                      color: AppColor.authPrimary,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Terms and Conditions tap
                        // Get.toNamed(Routes.termsAndConditionsRoute);
                      },
                  ),
                  const TextSpan(text: " and "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      color: AppColor.authPrimary,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Privacy Policy tap
                        // Get.toNamed(Routes.privacyPolicyRoute);
                      },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
