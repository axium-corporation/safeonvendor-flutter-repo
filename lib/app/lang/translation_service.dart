import "package:flutter/material.dart";
import "package:get/get.dart";

class TranslationService extends Translations {
  final Map<String, Map<String, String>> languages;
  TranslationService({required this.languages});

  static Locale? get locale {
    // Get device locale
    final deviceLocale = Get.deviceLocale;

    if (deviceLocale != null) {
      final languageCode = deviceLocale.languageCode;
      // final countryCode = deviceLocale.countryCode;

      // Define supported languages with their country codes
      final supportedLanguages = {"en": "US"};

      // Check if device language is supported
      if (supportedLanguages.containsKey(languageCode)) {
        final supportedCountryCode = supportedLanguages[languageCode]!;
        return Locale(languageCode, supportedCountryCode);
      }
    }

    // Fallback to English if device language is not supported
    return const Locale("en", "US");
  }

  static const fallbackLocale = Locale("en", "US");

  @override
  Map<String, Map<String, String>> get keys {
    return languages;
  }
}
