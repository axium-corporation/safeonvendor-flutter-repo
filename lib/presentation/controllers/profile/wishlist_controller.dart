import 'package:get/get.dart';

class WishlistController extends GetxController {
  // Observable variables
  final isLoading = false.obs;
  final wishlistItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadWishlist();
  }

  // Load wishlist data
  Future<void> loadWishlist() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Dummy wishlist data
      wishlistItems.value = [
        {
          'id': 1,
          'imageUrl': 'assets/images/products/smoke_detector_1.png',
          'productName': 'First Alert 9120B Hardwired Smoke Detector',
          'originalPrice': 2500,
          'discountedPrice': 1300,
          'discount': 50,
          'rating': 4.6,
          'reviews': 135,
        },
        {
          'id': 2,
          'imageUrl': 'assets/images/products/smoke_detector_2.png',
          'productName': 'Kidde i12060 Ionization Smoke Alarm',
          'originalPrice': 2500,
          'discountedPrice': 1300,
          'discount': 50,
          'rating': 4.8,
          'reviews': 240,
        },
        {
          'id': 3,
          'imageUrl': 'assets/images/products/fire_detector_1.png',
          'productName': 'BRK 3120B Hardwired Smoke Detector',
          'originalPrice': 2500,
          'discountedPrice': 1300,
          'discount': 50,
          'rating': 4.7,
          'reviews': 189,
        },
        {
          'id': 4,
          'imageUrl': 'assets/images/products/smoke_detector_3.png',
          'productName': 'First Alert SA303CN3 Ionization Smoke Alarm',
          'originalPrice': 2500,
          'discountedPrice': 1300,
          'discount': 50,
          'rating': 4.5,
          'reviews': 156,
        },
      ];
      
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  // Remove item from wishlist
  void removeFromWishlist(int itemId) {
    wishlistItems.removeWhere((item) => item['id'] == itemId);
    Get.snackbar('Removed', 'Item removed from wishlist');
  }

  // Add item to cart
  void addToCart(int itemId) {
    Get.snackbar('Added', 'Item added to cart successfully');
  }
}

