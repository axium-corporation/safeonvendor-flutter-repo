import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';

class AddressController extends GetxController {
  // Observable variables
  final isLoading = false.obs;
  final billingAddresses = <Map<String, dynamic>>[].obs;
  final shippingAddresses = <Map<String, dynamic>>[].obs;
  final selectedTab = 0.obs; // 0: Billing, 1: Shipping
  final showDropdown = <int, bool>{}.obs;

  // Form fields for add/edit
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final countryCode = '+91'.obs;
  final selectedCountry = 'Select Country'.obs;
  final selectedState = 'State'.obs;
  final houseNoController = TextEditingController();
  final areaStreetController = TextEditingController();
  final landmarkController = TextEditingController();
  final townCityController = TextEditingController();
  final pincodeController = TextEditingController();
  final isDefaultBilling = false.obs;
  final isDefaultShipping = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAddresses();
  }

  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    houseNoController.dispose();
    areaStreetController.dispose();
    landmarkController.dispose();
    townCityController.dispose();
    pincodeController.dispose();
    super.onClose();
  }

  // Get current addresses based on selected tab
  List<Map<String, dynamic>> get addresses {
    return selectedTab.value == 0 ? billingAddresses : shippingAddresses;
  }

  // Load addresses
  Future<void> loadAddresses() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 500));

      // Dummy billing addresses (3 addresses)
      billingAddresses.value = [
        {
          'id': 1,
          'name': 'ZoyaZara',
          'houseNo': 'Door 12, 123 Maple Street',
          'landmark': 'Near Central Park',
          'city': 'Springfield',
          'state': 'IL',
          'zip': '62704',
          'isDefault': true,
          'type': 'billing',
        },
        {
          'id': 2,
          'name': 'ZoyaZara',
          'houseNo': 'Door 3A, 456 Oak Avenue',
          'landmark': 'Opposite City Library',
          'city': 'New York',
          'state': 'NY',
          'zip': '10001',
          'isDefault': false,
          'type': 'billing',
        },
        {
          'id': 3,
          'name': 'ZoyaZara',
          'houseNo': 'Door 7B, 789 Pine Lane',
          'landmark': 'Beside Sunset Mall',
          'city': 'Los Angeles',
          'state': 'CA',
          'zip': '90012',
          'isDefault': false,
          'type': 'billing',
        },
      ];

      // Dummy shipping addresses (1 address)
      shippingAddresses.value = [
        {
          'id': 4,
          'name': 'ZoyaZara',
          'houseNo': 'Door 3A, 456 Oak Avenue',
          'landmark': 'Opposite City Library',
          'city': 'New York',
          'state': 'NY',
          'zip': '10001',
          'isDefault': false,
          'type': 'shipping',
        },
      ];

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  // Select tab
  void selectTab(int tabIndex) {
    selectedTab.value = tabIndex;
  }

  // Toggle dropdown
  void toggleDropdown(int addressId) {
    showDropdown[addressId] = !(showDropdown[addressId] ?? false);
  }

  // Check if dropdown is shown
  bool isDropdownShown(int addressId) {
    return showDropdown[addressId] ?? false;
  }

  // Navigate to add address
  void navigateToAddAddress() {
    clearForm();
    // Set default radio based on current tab
    if (selectedTab.value == 0) {
      isDefaultBilling.value = false;
      isDefaultShipping.value = false;
    } else {
      isDefaultBilling.value = false;
      isDefaultShipping.value = false;
    }
    Get.toNamed(Routes.addAddressRoute, arguments: {'type': selectedTab.value == 0 ? 'billing' : 'shipping'});
  }

  // Navigate to edit address
  void navigateToEditAddress(Map<String, dynamic> address) {
    nameController.text = address['name'] ?? '';
    mobileController.text = address['mobile'] ?? '';
    houseNoController.text = address['houseNo'] ?? '';
    areaStreetController.text = address['areaStreet'] ?? '';
    landmarkController.text = address['landmark'] ?? '';
    townCityController.text = address['city'] ?? '';
    pincodeController.text = address['zip'] ?? '';
    selectedCountry.value = address['country'] ?? 'Select Country';
    selectedState.value = address['state'] ?? 'State';
    isDefaultBilling.value = address['isDefault'] == true && address['type'] == 'billing';
    isDefaultShipping.value = address['isDefault'] == true && address['type'] == 'shipping';
    Get.toNamed(
      Routes.addAddressRoute,
      arguments: {'id': address['id'], 'isEdit': true, 'type': address['type']},
    );
  }

  // Delete address
  void deleteAddress(int addressId) {
    Get.defaultDialog(
      title: 'Delete Address',
      middleText: 'Are you sure you want to delete this address?',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      confirmTextColor: Colors.red,
      buttonColor: Colors.red,
      onConfirm: () {
        if (selectedTab.value == 0) {
          billingAddresses.removeWhere((addr) => addr['id'] == addressId);
        } else {
          shippingAddresses.removeWhere((addr) => addr['id'] == addressId);
        }
        showDropdown.remove(addressId);
        Get.back();
        Get.snackbar('Success', 'Address deleted successfully');
      },
    );
  }

  // Save address
  void saveAddress({int? editId, String? addressType}) {
    if (nameController.text.isEmpty ||
        mobileController.text.isEmpty ||
        houseNoController.text.isEmpty ||
        areaStreetController.text.isEmpty ||
        townCityController.text.isEmpty ||
        pincodeController.text.isEmpty ||
        selectedCountry.value == 'Select Country' ||
        selectedState.value == 'State') {
      Get.snackbar('Error', 'Please fill all required fields');
      return;
    }

    // Determine address type: use addressType from navigation, or radio button selection
    String type;
    if (addressType != null) {
      type = addressType;
    } else if (isDefaultBilling.value) {
      type = 'billing';
    } else if (isDefaultShipping.value) {
      type = 'shipping';
    } else {
      // Default to current tab if no selection
      type = selectedTab.value == 0 ? 'billing' : 'shipping';
    }

    // If setting as default, unset other defaults of same type
    if (type == 'billing' && isDefaultBilling.value) {
      for (var addr in billingAddresses) {
        addr['isDefault'] = false;
      }
    }
    if (type == 'shipping' && isDefaultShipping.value) {
      for (var addr in shippingAddresses) {
        addr['isDefault'] = false;
      }
    }

    final isDefault = (type == 'billing' && isDefaultBilling.value) ||
        (type == 'shipping' && isDefaultShipping.value);

    final addressData = {
      'name': nameController.text,
      'mobile': mobileController.text,
      'houseNo': houseNoController.text,
      'areaStreet': areaStreetController.text,
      'landmark': landmarkController.text,
      'city': townCityController.text,
      'state': selectedState.value,
      'zip': pincodeController.text,
      'country': selectedCountry.value,
      'type': type,
      'isDefault': isDefault,
    };

    if (editId != null) {
      // Edit existing address
      if (type == 'billing') {
        final index = billingAddresses.indexWhere((addr) => addr['id'] == editId);
        if (index != -1) {
          billingAddresses[index] = {...addressData, 'id': editId};
        }
      } else {
        final index = shippingAddresses.indexWhere((addr) => addr['id'] == editId);
        if (index != -1) {
          shippingAddresses[index] = {...addressData, 'id': editId};
        }
      }
      Get.back();
      Get.snackbar('Success', 'Address updated successfully');
    } else {
      // Add new address
      final allAddresses = [...billingAddresses, ...shippingAddresses];
      final newId = allAddresses.isEmpty
          ? 1
          : allAddresses
                    .map((e) => e['id'] as int)
                    .reduce((a, b) => a > b ? a : b) +
                1;

      if (type == 'billing') {
        billingAddresses.add({...addressData, 'id': newId});
      } else {
        shippingAddresses.add({...addressData, 'id': newId});
      }
      Get.back();
      Get.snackbar('Success', 'Address added successfully');
    }

    clearForm();
  }

  // Clear form
  void clearForm() {
    nameController.clear();
    mobileController.clear();
    houseNoController.clear();
    areaStreetController.clear();
    landmarkController.clear();
    townCityController.clear();
    pincodeController.clear();
    selectedCountry.value = 'Select Country';
    selectedState.value = 'State';
    isDefaultBilling.value = false;
    isDefaultShipping.value = false;
  }
}
