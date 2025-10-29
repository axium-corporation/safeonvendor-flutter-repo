import 'package:flutter/material.dart';
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      // Login Title
                      Text(
                        'Login',
                        style: AppTextStyles.kInterTextStyle26with600(
                          AppColor.pureBlack,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Buttons
                      Obx(() => _buildContinueButton()),
                      const SizedBox(height: 12),
                      Obx(() => _buildCreateAccountButton()),
                      const SizedBox(height: 20),
                      // Divider with text
                      _buildDivider(),
                      const SizedBox(height: 20),
                      // Email Input
                      CustomTextFeild(
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
                        fillColor: AppColor.gray50,
                        borderColor: AppColor.gray300,
                        borderRadius: 6,
                        paddingReduces: true,
                        autoValidate: false,
                      ),
                      const Spacer(),
                      // Terms and Conditions
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

  Widget _buildContinueButton() {
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
          // Handle continue
        },
        child: Text(
          'Continue',
          style: AppTextStyles.kPoppinsTextStyle16with600(AppColor.pureWhite),
        ),
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
          Get.toNamed(Routes.registerScreenRoute);
        },
        child: Text(
          'Create your safeon account',
          style: AppTextStyles.kInterTextStyle16with600(AppColor.pureWhite),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: const Color(0xFF72CBF4))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'New to Safeon?',
            style: AppTextStyles.kInterTextStyle12with400(AppColor.pureBlack),
          ),
        ),
        Expanded(child: Container(height: 1, color: const Color(0xFF72CBF4))),
      ],
    );
  }

  Widget _buildTermsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text(
        "By continuing an account you agree to Safeon's\nTerms and Conditions and Privacy Policy",
        textAlign: TextAlign.center,
        style: AppTextStyles.kRobotoFlexTextStyle12with600(AppColor.pureBlack),
      ),
    );
  }
}
