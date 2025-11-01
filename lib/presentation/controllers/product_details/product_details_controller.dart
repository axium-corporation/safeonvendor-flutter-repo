import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';

class ProductDetailsController extends GetxController {
  // Observable variables
  final isLoading = false.obs;
  final selectedImageIndex = 0.obs;
  final quantity = 2.obs;
  final selectedTab = 0.obs; // 0: Description, 1: Reviews, 2: Specifications

  // Product details (dummy data)
  final productImages = <String>[].obs;
  final productName = ''.obs;
  final originalPrice = 0.obs;
  final discountedPrice = 0.obs;
  final discount = 0.obs;
  final rating = 0.0.obs;
  final reviewsCount = 0.obs;
  final gst = 0.obs;
  final totalWithTaxes = 0.obs;
  final tags = <String>[].obs;
  final specifications = <Map<String, String>>[].obs;
  final description = ''.obs;
  final inStock = true.obs;

  // Related products
  final relatedProducts = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProductDetails();
  }

  void loadProductDetails() {
    isLoading.value = true;

    // Dummy data
    productImages.value = [
      'assets/images/product_placeholder.png',
      'assets/images/product_placeholder.png',
      'assets/images/product_placeholder.png',
    ];

    productName.value = 'First Alert 9120B Hardwired Smoke Detector';
    originalPrice.value = 315;
    discountedPrice.value = 211;
    discount.value = 20;
    rating.value = 4.6;
    reviewsCount.value = 135;
    gst.value = 38;
    totalWithTaxes.value = 249;

    tags.value = ['India', 'Sativa 100%'];

    specifications.value = [
      {
        'title': 'Temperature Rating',
        'description': 'Temperature Rating: 155 deg F/68 deg C.',
        'icon': 'water-arrow-down'
      },
      {
        'title': 'Color',
        'description': 'Glass Bulb Colour: Red.',
        'icon': 'brain-freeze'
      },
      {
        'title': 'Pressure',
        'description': 'Max. Service Pressure: 175 psi.',
        'icon': 'smoke'
      },
    ];

    description.value =
        'Palex Pendant Type Sprinkler is a premium quality product from Palex . Moglix is a well-known ecommerce platform for qualitative range of Sprinklers. All Palex Pendant Type Sprinkler are manufactured by using quality assured material and advanced techniques, which make them up to the standard in this highly challenging field. The materials utilized to';

    // Related products
    relatedProducts.value = [
      {
        'id': 1,
        'productName': 'Fire Branch Pipe Nozzle',
        'imageUrl': 'assets/images/product_placeholder.png',
        'originalPrice': 6000,
        'discountedPrice': 3000,
        'discount': 50,
        'rating': 4.5,
      },
      {
        'id': 2,
        'productName': 'Fire Branch Pipe Nozzle',
        'imageUrl': 'assets/images/product_placeholder.png',
        'originalPrice': 6000,
        'discountedPrice': 3000,
        'discount': 50,
        'rating': 4.5,
      },
    ];

    isLoading.value = false;
  }

  void changeImage(int index) {
    selectedImageIndex.value = index;
  }

  void selectTab(int index) {
    selectedTab.value = index;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void addToCart() {
    Get.snackbar('Success', 'Product added to cart');
  }

  void buyNow() {
    Get.snackbar('Buy Now', 'Proceeding to checkout');
  }

  void navigateToSearch() {
    Get.toNamed(Routes.searchRoute);
  }

  void navigateToFilter() {
    Get.toNamed(Routes.filterRoute);
  }
}

