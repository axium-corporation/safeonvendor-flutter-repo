import 'package:get/get.dart';

class CategoriesController extends GetxController {
  // Observable variables
  final selectedFilterIndex = 0.obs;
  final isLoading = false.obs;

  // Filter Categories
  final filterCategories = <String>[
    'All',
    'Fire Detection System',
    'Fire Extinguishers',
    'Safety Gears',
    'Sprinklers',
  ].obs;

  // All Categories Data with Products
  final allCategoriesData = <Map<String, dynamic>>[
    {
      'categoryName': 'Smoke Detectors',
      'products': [
        {
          'imageUrl': 'assets/images/products/smoke_detector_1.png',
          'productName': 'Ionization Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/smoke_detector_2.png',
          'productName': 'Photoelectric Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/smoke_detector_3.png',
          'productName': 'Dual Sensor Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
      ],
    },
    {
      'categoryName': 'Heat Detectors',
      'products': [
        {
          'imageUrl': 'assets/images/products/heat_detector_1.png',
          'productName': 'Standard Fire Hoses',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
        {
          'imageUrl': 'assets/images/products/heat_detector_2.png',
          'productName': 'Lay-Flat Fire Hoses',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
        {
          'imageUrl': 'assets/images/products/heat_detector_3.png',
          'productName': 'Lay-Flat Fire Hoses',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
      ],
    },
    {
      'categoryName': 'Flame Detectors',
      'products': [
        {
          'imageUrl': 'assets/images/products/flame_detector_1.png',
          'productName': 'Infrared Flame Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/flame_detector_2.png',
          'productName': 'Ultraviolet Flame Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/flame_detector_3.png',
          'productName': 'Lay-Flat Fire Hoses',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
      ],
    },
    {
      'categoryName': 'Residential Ionization Smoke Detectors',
      'products': [
        {
          'imageUrl': 'assets/images/products/residential_smoke_1.png',
          'productName': 'First Alert 9120B Hardwired Smoke Detector',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
        {
          'imageUrl': 'assets/images/products/residential_smoke_2.png',
          'productName': 'Kidde i12060 Ionization Smoke Alarm',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
      ],
    },
    {
      'categoryName': 'Ionization Smoke Detectors',
      'products': [
        {
          'imageUrl': 'assets/images/products/ionization_1.png',
          'productName': 'Residential Ionization Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/ionization_2.png',
          'productName': 'Commercial Ionization Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/ionization_3.png',
          'productName': 'Residential Ionization Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
      ],
    },
    {
      'categoryName': 'Photoelectric Smoke Detectors',
      'products': [
        {
          'imageUrl': 'assets/images/products/photoelectric_1.png',
          'productName': 'Residential Photoelectric Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/photoelectric_2.png',
          'productName': 'Commercial Photoelectric Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/photoelectric_3.png',
          'productName': 'Residential Ionization Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
      ],
    },
    {
      'categoryName': 'Aspirating Smoke Detectors',
      'products': [
        {
          'imageUrl': 'assets/images/products/aspirating_1.png',
          'productName': 'Point-Type Aspirating Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/aspirating_2.png',
          'productName': 'Addressable Aspirating Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': false,
        },
        {
          'imageUrl': 'assets/images/products/aspirating_3.png',
          'productName': 'Hardwired Dual Sensor Smoke Detectors',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
      ],
    },
    {
      'categoryName': 'Additional Products',
      'products': [
        {
          'imageUrl': 'assets/images/products/additional_1.png',
          'productName': 'Kidde i9040 Battery-Operated Smoke Alarm',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
        {
          'imageUrl': 'assets/images/products/additional_2.png',
          'productName': 'Firex i4618AC Ionization Smoke Alarm',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
      ],
    },
    {
      'categoryName': 'More Products',
      'products': [
        {
          'imageUrl': 'assets/images/products/more_1.png',
          'productName': 'BRK 3120B Hardwired Smoke Detector',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
        {
          'imageUrl': 'assets/images/products/more_2.png',
          'productName': 'First Alert SA303CN3 Ionization Smoke Alarm',
          'currentPrice': '₹1300',
          'originalPrice': '₹2500',
          'discount': '50% OFF',
          'saveAmount': 'Save - ₹1200',
          'rating': 5.0,
          'showDiscount': true,
        },
      ],
    },
  ].obs;

  // Filtered categories based on selected filter
  List<Map<String, dynamic>> get filteredCategories {
    if (selectedFilterIndex.value == 0) {
      // Show all categories
      return allCategoriesData;
    } else {
      // Filter based on selected category
      // For now, showing all as we don't have specific category mappings
      // In real app, you would filter based on the selected filter
      return allCategoriesData;
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  // Update selected filter
  void updateFilter(int index) {
    selectedFilterIndex.value = index;
  }

  // Load data (can be replaced with API calls)
  Future<void> loadData() async {
    try {
      isLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
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

