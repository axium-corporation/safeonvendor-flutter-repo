import "package:flutter/material.dart";
import "package:get/get.dart";

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  RxBool isLoginPasswordEmpty = true.obs; // true = no text
  RxBool isLoginObscure = true.obs; // true = hidden

  RxBool isLoading = false.obs;

  /*---------------------------------Forgot Password ---------------------------------*/
  RxBool isCardShrink = false.obs;
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final forgotPasswordEmailController = TextEditingController();

  /*---------------------------------Otp Screen Password ---------------------------------*/
  // List of controllers for each box
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  RxBool showOtpError = false.obs;
  /*---------------------------------New Password ---------------------------------*/
  final newPasswordFormKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  // For New Password
  RxBool isNewPasswordEmpty = true.obs;
  RxBool isNewObsureBool = true.obs;

  // For Confirm Password
  RxBool isConfirmPasswordEmpty = true.obs;
  RxBool isConfirmPasswordObsureBool = true.obs;

  /*---------------------------------Contact Us ---------------------------------*/
  final contactUsFormKey = GlobalKey<FormState>();
  final contactUsNameController = TextEditingController();
  final contactUsPhoneController = TextEditingController();
  final contactUsMessageController = TextEditingController();
}
