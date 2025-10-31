import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable variables
  final currentBannerIndex = 0.obs;
  final isLoading = false.obs;

  // Categories Data
  final categories = <Map<String, dynamic>>[
    {
      'title': 'Fire Detection\nSystems',
      'imageUrl': 'assets/images/categories/fire_detection.png',
    },
    {
      'title': 'Fire Suppression\nSystems',
      'imageUrl': 'assets/images/categories/fire_suppression.png',
    },
    {
      'title': 'Fire Protection\nAccessories',
      'imageUrl': 'assets/images/categories/fire_protection.png',
    },
    {
      'title': 'Fire Escape and\nEmergency',
      'imageUrl': 'assets/images/categories/fire_escape.png',
    },
  ].obs;

  // Top Products Data
  final topProducts = <Map<String, dynamic>>[
    {'title': 'Dresses', 'imageUrl': 'assets/images/top_products/dresses.png'},
    {'title': 'T-Shirts', 'imageUrl': 'assets/images/top_products/tshirts.png'},
    {'title': 'Skirts', 'imageUrl': 'assets/images/top_products/skirts.png'},
    {'title': 'Shoes', 'imageUrl': 'assets/images/top_products/shoes.png'},
    {'title': 'Bags', 'imageUrl': 'assets/images/top_products/bags.png'},
  ].obs;

  // New Products Data
  final newProducts = <Map<String, dynamic>>[
    {
      'imageUrl': 'assets/images/products/safety_jacket_1.png',
      'productName': 'Net Industrial\nSafety Jacket',
      'currentPrice': '₹750',
      'originalPrice': '₹1200',
      'discount': '50% OFF',
      'saveAmount': 'Save - ₹450',
      'rating': 5.0,
      'showDiscount': true,
    },
    {
      'imageUrl': 'assets/images/products/safety_jacket_2.png',
      'productName': 'Plain Safety\nJacket',
      'currentPrice': '₹650',
      'originalPrice': '₹900',
      'discount': '50% OFF',
      'saveAmount': 'Save - ₹250',
      'rating': 5.0,
      'showDiscount': true,
    },
    {
      'imageUrl': 'assets/images/products/fire_nozzle.png',
      'productName': 'Fire Branch Pipe Nozzle',
      'currentPrice': '₹1000',
      'originalPrice': '₹6000',
      'discount': '50% OFF',
      'saveAmount': 'Save - ₹1000',
      'rating': 5.0,
      'showDiscount': false,
    },
  ].obs;

  // Popular Products Data
  final popularProducts = <Map<String, dynamic>>[
    {
      'imageUrl': 'assets/images/products/safety_jacket_1.png',
      'productName': 'Net Industrial\nSafety Jacket',
      'currentPrice': '₹750',
      'originalPrice': '₹1200',
      'discount': '50% OFF',
      'saveAmount': 'Save - ₹450',
      'rating': 5.0,
      'showDiscount': true,
    },
    {
      'imageUrl': 'assets/images/products/safety_jacket_2.png',
      'productName': 'Plain Safety\nJacket',
      'currentPrice': '₹650',
      'originalPrice': '₹900',
      'discount': '50% OFF',
      'saveAmount': 'Save - ₹250',
      'rating': 5.0,
      'showDiscount': true,
    },
    {
      'imageUrl': 'assets/images/products/fire_nozzle.png',
      'productName': 'Fire Branch Pipe Nozzle',
      'currentPrice': '₹1000',
      'originalPrice': '₹6000',
      'discount': '50% OFF',
      'saveAmount': 'Save - ₹1000',
      'rating': 5.0,
      'showDiscount': false,
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _startBannerAutoScroll();
    loadData();
  }

  // Auto scroll banner
  void _startBannerAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (currentBannerIndex.value < 4) {
        currentBannerIndex.value++;
      } else {
        currentBannerIndex.value = 0;
      }
      _startBannerAutoScroll();
    });
  }

  // Load data (can be replaced with API calls)
  Future<void> loadData() async {
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

  // Refresh data
  Future<void> refreshData() async {
    await loadData();
  }
}
