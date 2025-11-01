import 'package:get/get.dart';

class LanguageSelectionController extends GetxController {
  // Observable variables
  final selectedLanguage = 'Hindi'.obs;
  final languages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadLanguages();
  }

  // Load languages
  void loadLanguages() {
    languages.value = [
      'Hindi',
      'Tamil',
      'Kannada',
      'Telugu',
      'Malayalam',
      'Bengali',
      'Marathi',
      'Gujarati',
      'Punjabi',
      'Urdu',
    ];
  }

  // Select language
  void selectLanguage(String language) {
    selectedLanguage.value = language;
    // Here you can implement actual language change logic
  }
}

