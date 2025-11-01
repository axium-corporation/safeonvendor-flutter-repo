import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  // Text controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable variables
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Load user data
  void loadUserData() {
    // Pre-fill with dummy data
    nameController.text = 'ZoyaZara';
    phoneController.text = '+919875435459';
    emailController.text = 'gmail@example.com';
    passwordController.text = '************';
  }

  // Save changes
  void saveChanges() {
    // Validate fields
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
      return;
    }

    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your phone number');
      return;
    }

    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your email');
      return;
    }

    // Save logic here
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  // Edit profile image
  void editProfileImage() {
    // Image picker logic here
    Get.snackbar('Info', 'Profile image edit functionality');
  }
}

