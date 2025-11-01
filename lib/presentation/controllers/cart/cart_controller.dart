import 'package:get/get.dart';

class CartController extends GetxController {
  // Observable variables
  final isLoading = false.obs;
  final cartItems = <Map<String, dynamic>>[].obs;
  
  // Expanded state for each item
  final expandedItems = <int, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadCartData();
  }

  // Load cart data
  Future<void> loadCartData() async {
    try {
      isLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Add dummy cart items
      cartItems.value = [
        {
          'id': 1,
          'imageUrl': 'assets/images/products/smoke_detector_1.png',
          'productName': 'First Alert 9120B Hardwired Smoke Detector',
          'tags': ['India', 'Sativa 100%'],
          'originalPrice': 315,
          'discount': 20,
          'discountedPrice': 211,
          'gst': 38,
          'totalWithTax': 249,
          'rating': 4.6,
          'reviews': 135,
          'quantity': 2,
          'deliveryDate': 'Sep 18, Wed',
          'deliveryCharge': 'FREE',
        },
        {
          'id': 2,
          'imageUrl': 'assets/images/products/smoke_detector_2.png',
          'productName': 'Kidde i12060 Ionization Smoke Alarm',
          'tags': ['USA', 'Commercial Grade'],
          'originalPrice': 450,
          'discount': 15,
          'discountedPrice': 382,
          'gst': 68,
          'totalWithTax': 450,
          'rating': 4.8,
          'reviews': 240,
          'quantity': 1,
          'deliveryDate': 'Sep 20, Fri',
          'deliveryCharge': 'FREE',
        },
        {
          'id': 3,
          'imageUrl': 'assets/images/products/fire_detector_1.png',
          'productName': 'Photoelectric Smoke Detector with Battery Backup',
          'tags': ['Premium', 'Certified'],
          'originalPrice': 580,
          'discount': 25,
          'discountedPrice': 435,
          'gst': 78,
          'totalWithTax': 513,
          'rating': 4.7,
          'reviews': 189,
          'quantity': 1,
          'deliveryDate': 'Sep 19, Thu',
          'deliveryCharge': '₹40',
        },
      ];
      
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // Handle error
    }
  }

  // Toggle expand/collapse for a specific item
  void toggleExpanded(int itemId) {
    expandedItems[itemId] = !(expandedItems[itemId] ?? false);
  }

  // Check if item is expanded
  bool isExpanded(int itemId) {
    return expandedItems[itemId] ?? false;
  }

  // Update quantity
  void updateQuantity(int itemId, int newQuantity) {
    if (newQuantity < 1) return;
    
    final index = cartItems.indexWhere((item) => item['id'] == itemId);
    if (index != -1) {
      cartItems[index]['quantity'] = newQuantity;
      cartItems.refresh();
    }
  }

  // Increase quantity
  void increaseQuantity(int itemId) {
    final index = cartItems.indexWhere((item) => item['id'] == itemId);
    if (index != -1) {
      cartItems[index]['quantity']++;
      cartItems.refresh();
    }
  }

  // Decrease quantity
  void decreaseQuantity(int itemId) {
    final index = cartItems.indexWhere((item) => item['id'] == itemId);
    if (index != -1 && cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      cartItems.refresh();
    }
  }

  // Delete item from cart
  void deleteItem(int itemId) {
    Get.defaultDialog(
      title: 'Remove Item',
      middleText: 'Are you sure you want to remove this item from cart?',
      textConfirm: 'Remove',
      textCancel: 'Cancel',
      confirmTextColor: Get.theme.colorScheme.error,
      onConfirm: () {
        cartItems.removeWhere((item) => item['id'] == itemId);
        expandedItems.remove(itemId);
        Get.back();
        Get.snackbar('Success', 'Item removed from cart');
      },
    );
  }

  // Calculate totals
  int get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (item['originalPrice'] as int) * (item['quantity'] as int));
  }

  int get totalDiscount {
    return cartItems.fold(0, (sum, item) {
      final price = item['originalPrice'] as int;
      final discount = item['discount'] as int;
      final quantity = item['quantity'] as int;
      return sum + ((price * discount ~/ 100) * quantity);
    });
  }

  int get totalGST {
    return cartItems.fold(0, (sum, item) => sum + (item['gst'] as int) * (item['quantity'] as int));
  }

  String get shippingCharges {
    final hasNonFreeShipping = cartItems.any((item) => item['deliveryCharge'] != 'FREE');
    return hasNonFreeShipping ? '₹40' : 'FREE';
  }

  int get grandTotal {
    final shipping = shippingCharges == 'FREE' ? 0 : 40;
    return subtotal - totalDiscount + totalGST + shipping;
  }

  // Navigate to checkout
  void proceedToCheckout() {
    if (cartItems.isEmpty) {
      Get.snackbar('Cart Empty', 'Please add items to cart before checkout');
      return;
    }
    // Navigate to checkout screen
    Get.snackbar('Checkout', 'Proceeding to checkout with ${cartItems.length} items');
  }

  // Enquire for installation service
  void enquireInstallation() {
    Get.snackbar('Enquiry', 'Our team will contact you shortly for installation service');
  }
}

