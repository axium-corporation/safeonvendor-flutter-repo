import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/auth/auth_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';
import 'package:safeonvendor_flutter_repo/presentation/widgets/text_form_field.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

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
              AppColor.authPrimaryAlt.withOpacity(0.8),
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
                    child: Opacity(
                      opacity: 1 - value,
                      child: _buildLoginCard(),
                    ),
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

  Widget _buildLoginCard() {
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
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  // Animated Login Title
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 600),
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 30 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: Text(
                            'Login',
                            style: AppTextStyles.kInterTextStyle26with600(
                              AppColor.pureBlack,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  // Animated Email Input
                  _buildAnimatedEmailInput(),
                  const SizedBox(height: 20),
                  // Animated Continue Button
                  _buildAnimatedContinueButton(),
                  const SizedBox(height: 20),
                  // Animated Divider
                  _buildAnimatedDivider(),
                  const SizedBox(height: 20),
                  // Animated Create Account Button
                  _buildAnimatedCreateAccountButton(),
                  const SizedBox(height: 40),
                  // Animated Terms
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

  Widget _buildAnimatedContinueButton() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 700),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 40 * (1 - value)),
          child: Opacity(opacity: value, child: _buildContinueButton()),
        );
      },
    );
  }

  Widget _buildAnimatedCreateAccountButton() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 900),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 40 * (1 - value)),
          child: Opacity(opacity: value, child: _buildCreateAccountButton()),
        );
      },
    );
  }

  Widget _buildContinueButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.authPrimary, AppColor.authPrimary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColor.authPrimary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle continue with haptic feedback
            // HapticFeedback.lightImpact();
          },
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              'Continue',
              style: AppTextStyles.kPoppinsTextStyle16with600(
                AppColor.pureWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.authPrimary.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.registerScreenRoute);
          },
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              'Create your safeon account',
              style: AppTextStyles.kInterTextStyle16with600(
                AppColor.authPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedDivider() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColor.authPrimary.withOpacity(0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'New to Safeon?',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColor.authPrimary.withOpacity(0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnimatedEmailInput() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1100),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CustomTextFeild(
                label: '',
                controller: controller.loginEmailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email or mobile number';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                maxLEngth: null,
                hint: 'Email or Mobile Number',
                fillColor: Colors.grey[50],
                borderColor: Colors.grey[200]!,
                borderRadius: 12,
                paddingReduces: true,
                autoValidate: false,
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
                  const TextSpan(
                    text: "By continuing an account you agree to ",
                  ),
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
