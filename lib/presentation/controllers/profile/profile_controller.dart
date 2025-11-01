import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';

class ProfileController extends GetxController {
  // Observable variables
  final isLoading = false.obs;

  // User data (replace with actual user data from API)
  final userName = 'John Doe'.obs;
  final userEmail = 'john.doe@example.com'.obs;
  final userPhone = '+91 9876543210'.obs;
  final userCountry = 'India'.obs;
  final userLanguage = 'English'.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  // Load user data
  Future<void> loadUserData() async {
    try {
      isLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
      // Data is already initialized above
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // Handle error
    }
  }

  // Navigation methods
  void navigateToProfile() {
    Get.toNamed(Routes.settingsRoute);
  }

  void navigateToOrders() {
    // Navigate to orders screen
    Get.toNamed(Routes.ordersRoute);
  }

  void navigateToAddress() {
    // Navigate to address screen
    Get.toNamed(Routes.addressRoute);
  }

  void navigateToPaymentMethods() {
    // Navigate to payment methods screen
    Get.snackbar('Payment', 'Navigate to payment methods screen');
  }

  void navigateToNotifications() {
    // Navigate to notifications settings screen
    Get.toNamed(Routes.notificationsRoute);
  }

  void navigateToWishlist() {
    // Navigate to wishlist screen
    Get.toNamed(Routes.wishlistRoute);
  }

  void navigateToCountry() {
    // Navigate to country selection screen
    Get.toNamed(Routes.countryRoute);
  }

  void navigateToLanguage() {
    // Navigate to language selection screen
    Get.toNamed(Routes.languageRoute);
  }

  void navigateToTerms() {
    // Navigate to terms and conditions screen
    Get.toNamed(Routes.termsRoute);
  }

  void navigateToAbout() {
    // Navigate to about screen
    Get.toNamed(Routes.aboutRoute);
  }

  // void navigateToSettings() {
  //   // Navigate to settings screen
  //   Get.toNamed(Routes.settingsRoute);
  // }

  // Logout
  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textConfirm: 'Yes',
      textCancel: 'No',
      onConfirm: () {
        Get.back();
        // Perform logout
        Get.offAllNamed('/LoginScreen');
      },
    );
  }

  // Delete account
  void deleteAccount() {
    Get.defaultDialog(
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account? This action cannot be undone.',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      confirmTextColor: Get.theme.colorScheme.error,
      onConfirm: () {
        Get.back();
        // Perform account deletion
        Get.snackbar(
          'Account Deleted',
          'Your account has been deleted successfully',
        );
      },
    );
  }
}
