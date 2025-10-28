import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

class LanguageController extends GetxController {
  late RxString selectedLanguage;
  final GetStorage _storage = GetStorage();
  static const String _languageKey = 'selected_language';

  @override
  void onInit() {
    super.onInit();
    // Initialize with stored language or device locale or default to English
    final storedLanguage = _storage.read(_languageKey);
    final deviceLanguage = Get.deviceLocale?.languageCode;

    if (storedLanguage != null) {
      selectedLanguage = RxString(storedLanguage.toString());
    } else if (deviceLanguage != null &&
        ['en', 'ka', 'hi', 'te', 'ta'].contains(deviceLanguage)) {
      selectedLanguage = RxString(deviceLanguage.toString());
    } else {
      selectedLanguage = RxString('en'); // Default to English
    }

    // Set the initial locale after the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setLocale(selectedLanguage.value);
    });
  }

  void changeLanguage(String languageCode) {
    if (['en', 'ka', 'hi', 'te', 'ta'].contains(languageCode)) {
      selectedLanguage.value = languageCode;
      _storage.write(_languageKey, languageCode);

      // Update locale after the current build phase
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _setLocale(languageCode);
      });
    }
  }

  void _setLocale(String languageCode) {
    switch (languageCode) {
      case 'en':
        Get.updateLocale(const Locale('en', 'US'));
        break;
    }
  }

  String get currentLanguageName {
    return getLanguageName(selectedLanguage.value);
  }

  static String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';

      default:
        return 'English';
    }
  }

  String get currentLanguageCode => selectedLanguage.value;

  // Get the current language name without depending on translations
  String get currentLanguageDisplayName {
    return getLanguageName(selectedLanguage.value);
  }
}
