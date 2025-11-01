import 'package:get/get.dart';

class FilterController extends GetxController {
  // Observable variables
  final minPrice = 0.obs;
  final maxPrice = 50000.obs;
  final selectedCategories = <String>[].obs;
  final selectedBrands = <String>[].obs;
  final selectedRating = 0.obs;

  // Filter options
  final categories = <Map<String, dynamic>>[].obs;
  final brands = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFilterOptions();
  }

  void loadFilterOptions() {
    // Categories with product count
    categories.value = [
      {'name': 'Fire and first aid blanket', 'count': 12},
      {'name': 'Fire alarm', 'count': 430},
      {'name': 'Fire alarm panel', 'count': 40},
      {'name': 'Smoke detectors', 'count': 20},
      {'name': 'Equipment fire', 'count': 34},
      {'name': 'Fire doors', 'count': 26},
      {'name': 'Fire blankets', 'count': 32},
      {'name': 'Fire buckets', 'count': 12},
      {'name': 'Safety Jacket', 'count': 10},
      {'name': 'Sprinklers', 'count': 8},
    ];

    brands.value = [
      'Palex',
      'Agni Kavach',
      'Ahuja',
      'Bright star',
      'HI-care',
      'Jaykey',
    ];
  }

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  void toggleBrand(String brand) {
    if (selectedBrands.contains(brand)) {
      selectedBrands.remove(brand);
    } else {
      selectedBrands.add(brand);
    }
  }

  void updateMinPrice(double value) {
    minPrice.value = value.round();
  }

  void updateMaxPrice(double value) {
    maxPrice.value = value.round();
  }

  void selectRating(int rating) {
    selectedRating.value = rating;
  }

  void applyFilters() {
    Get.back(result: {
      'minPrice': minPrice.value,
      'maxPrice': maxPrice.value,
      'categories': selectedCategories,
      'brands': selectedBrands,
      'rating': selectedRating.value,
    });
  }

  void resetAll() {
    minPrice.value = 0;
    maxPrice.value = 50000;
    selectedCategories.clear();
    selectedBrands.clear();
    selectedRating.value = 0;
  }
}

