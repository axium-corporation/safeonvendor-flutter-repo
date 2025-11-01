import 'package:get/get.dart';

class CountryController extends GetxController {
  // Observable variables
  final selectedCountry = 'India'.obs;
  final countries = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCountries();
  }

  // Load countries
  void loadCountries() {
    countries.value = [
      'India',
      'Afghanistan',
      'Albania',
      'Algeria',
      'Andorra',
      'Angola',
      'Argentina',
      'Armenia',
      'Bahamas',
      'Bangladesh',
      'Belgium',
    ];
  }

  // Select country
  void selectCountry(String country) {
    selectedCountry.value = country;
    // Here you can implement actual country change logic
  }
}

