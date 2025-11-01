import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  // Observable variables
  final searchQuery = ''.obs;
  final recentSearches = <String>[].obs;
  final browseCategories = <Map<String, String>>[].obs;

  // Text controller
  final searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }

  void loadData() {
    // Recent searches dummy data
    recentSearches.value = [
      'Smoke Detector',
      'Fire alarm',
      'Fire doors',
      'Fire blankets',
      'Fire buckets',
    ];

    // Browse categories dummy data
    browseCategories.value = [
      {'name': 'Detectors', 'icon': 'detector'},
      {'name': 'Fire Extinguishers', 'icon': 'extinguisher'},
      {'name': 'Safety Gear', 'icon': 'gear'},
      {'name': 'Sprinklers', 'icon': 'sprinkler'},
      {'name': 'Safety Jacket', 'icon': 'jacket'},
      {'name': 'Barriers', 'icon': 'barrier'},
      {'name': 'Sprinklers', 'icon': 'sprinkler'},
    ];
  }

  void performSearch(String query) {
    if (query.trim().isNotEmpty) {
      searchQuery.value = query;
      // Add to recent searches if not already present
      if (!recentSearches.contains(query)) {
        recentSearches.insert(0, query);
        if (recentSearches.length > 10) {
          recentSearches.removeAt(recentSearches.length - 1);
        }
      }
      Get.snackbar('Search', 'Searching for: $query');
    }
  }

  void removeRecentSearch(String search) {
    recentSearches.remove(search);
  }

  void selectCategory(String category) {
    searchTextController.text = category;
    performSearch(category);
  }
}

