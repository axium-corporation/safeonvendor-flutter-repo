import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/address_controller.dart';

class AddAddressScreen extends GetView<AddressController> {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final editId = args?['id'];
    final addressType = args?['type'] as String?;

    return Scaffold(
      backgroundColor: AppColor.pureWhite,
      body: Column(
        children: [
          // Header
          Container(
            color: AppColor.homePrimary,
            child: SafeArea(
              bottom: false,
              child: Container(
                height: 62,
                color: AppColor.homePrimary,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    // Back Button
                    GestureDetector(
                      onTap: () {
                        controller.clearForm();
                        Get.back();
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.pureWhite,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 21),
                    // Title
                    Text(
                      'Address',
                      style: AppTextStyles.kInterTextStyle16with600(
                        AppColor.pureWhite,
                      ).copyWith(fontSize: 18, height: 1.21),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Form
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Add New Address',
                    style:
                        AppTextStyles.kInterTextStyle14with600(
                          AppColor.pureBlack,
                        ).copyWith(
                          fontSize: 16,
                          height: 1.625,
                          letterSpacing: -0.02,
                        ),
                  ),

                  const SizedBox(height: 20),

                  // Name
                  _buildTextField(
                    controller: controller.nameController,
                    label: 'Name',
                    hint: 'Name',
                  ),

                  const SizedBox(height: 10),

                  // Mobile Number with Country Code
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Country Code Dropdown
                          Container(
                            height: 52,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.pureWhite,
                              border: Border.all(
                                color: const Color(0xFFD2D5DA),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(
                                  () => Text(
                                    controller.countryCode.value,
                                    style:
                                        AppTextStyles.kInterTextStyle14with400(
                                          const Color(0xFF6D7280),
                                        ).copyWith(
                                          fontSize: 16,
                                          height: 1.625,
                                          letterSpacing: -0.02,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 16,
                                  color: const Color(0xFF9CA3AF),
                                ),
                              ],
                            ),
                          ),
                          // Mobile Number Field
                          Expanded(
                            child: Container(
                              height: 52,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 13,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9FAFB),
                                border: Border.all(
                                  color: const Color(0xFFD2D5DA),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                ),
                              ),
                              child: TextField(
                                controller: controller.mobileController,
                                keyboardType: TextInputType.phone,
                                style:
                                    AppTextStyles.kInterTextStyle14with400(
                                      AppColor.pureBlack,
                                    ).copyWith(
                                      fontSize: 16,
                                      height: 1.625,
                                      letterSpacing: -0.02,
                                    ),
                                decoration: InputDecoration(
                                  hintText: 'Mobile number',
                                  hintStyle:
                                      AppTextStyles.kInterTextStyle14with400(
                                        const Color(0xFF6D7280),
                                      ).copyWith(
                                        fontSize: 16,
                                        height: 1.625,
                                        letterSpacing: -0.02,
                                      ),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Select Country
                  _buildDropdownField(
                    label: 'Select Country',
                    value: controller.selectedCountry.value,
                    onTap: () => _showCountryDialog(),
                  ),

                  const SizedBox(height: 10),

                  // State
                  _buildDropdownField(
                    label: 'State',
                    value: controller.selectedState.value,
                    onTap: () => _showStateDialog(),
                  ),

                  const SizedBox(height: 10),

                  // Town/City and Pincode (side by side)
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: controller.townCityController,
                          label: 'Town / City',
                          hint: 'Town / City',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildTextField(
                          controller: controller.pincodeController,
                          label: 'Pincode',
                          hint: 'Pincode',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // House No, Building name
                  _buildTextField(
                    controller: controller.houseNoController,
                    label: 'House No, Building name',
                    hint: 'House No, Building name',
                  ),

                  const SizedBox(height: 10),

                  // Area, Street, Village
                  _buildTextField(
                    controller: controller.areaStreetController,
                    label: 'Area, Street , Village',
                    hint: 'Area, Street , Village',
                  ),

                  const SizedBox(height: 10),

                  // Landmark
                  _buildTextField(
                    controller: controller.landmarkController,
                    label: 'Landmark',
                    hint: 'Landmark',
                  ),

                  const SizedBox(height: 40),

                  // Make this my default address
                  Text(
                    'Make this my default address',
                    style:
                        AppTextStyles.kInterTextStyle14with500(
                          AppColor.pureBlack,
                        ).copyWith(
                          fontSize: 16,
                          height: 1.625,
                          letterSpacing: -0.02,
                        ),
                  ),

                  const SizedBox(height: 16),

                  // Radio Buttons
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.isDefaultBilling.value =
                                  !controller.isDefaultBilling.value;
                              if (controller.isDefaultBilling.value) {
                                controller.isDefaultShipping.value = false;
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: controller.isDefaultBilling.value
                                          ? AppColor.homePrimary
                                          : const Color(0xFFD2D5DA),
                                      width: 1,
                                    ),
                                    color: controller.isDefaultBilling.value
                                        ? AppColor.homePrimary
                                        : AppColor.pureWhite,
                                  ),
                                  child: controller.isDefaultBilling.value
                                      ? Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 12,
                                            color: AppColor.pureWhite,
                                          ),
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Billing Address',
                                  style:
                                      AppTextStyles.kInterTextStyle14with400(
                                        AppColor.pureBlack,
                                      ).copyWith(
                                        fontSize: 16,
                                        height: 1.625,
                                        letterSpacing: -0.02,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.isDefaultShipping.value =
                                  !controller.isDefaultShipping.value;
                              if (controller.isDefaultShipping.value) {
                                controller.isDefaultBilling.value = false;
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: controller.isDefaultShipping.value
                                          ? AppColor.homePrimary
                                          : const Color(0xFFD2D5DA),
                                      width: 1,
                                    ),
                                    color: controller.isDefaultShipping.value
                                        ? AppColor.homePrimary
                                        : AppColor.pureWhite,
                                  ),
                                  child: controller.isDefaultShipping.value
                                      ? Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 12,
                                            color: AppColor.pureWhite,
                                          ),
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Shipping Address',
                                  style:
                                      AppTextStyles.kInterTextStyle14with400(
                                        AppColor.pureBlack,
                                      ).copyWith(
                                        fontSize: 16,
                                        height: 1.625,
                                        letterSpacing: -0.02,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Add Address Button
                  GestureDetector(
                    onTap: () => controller.saveAddress(
                      editId: editId,
                      addressType: addressType,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0071AF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Add Address',
                        style:
                            AppTextStyles.kInterTextStyle14with600(
                              AppColor.pureWhite,
                            ).copyWith(
                              fontSize: 16,
                              height: 1.625,
                              letterSpacing: -0.02,
                            ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            border: Border.all(color: const Color(0xFFD2D5DA), width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            controller: controller,
            style: AppTextStyles.kInterTextStyle14with400(
              AppColor.pureBlack,
            ).copyWith(fontSize: 16, height: 1.625, letterSpacing: -0.02),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.kInterTextStyle14with400(
                const Color(0xFF6D7280),
              ).copyWith(fontSize: 16, height: 1.625, letterSpacing: -0.02),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          border: Border.all(color: const Color(0xFFD2D5DA), width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: AppTextStyles.kInterTextStyle14with400(
                value == 'Select Country' || value == 'State'
                    ? const Color(0xFF6D7280)
                    : AppColor.pureBlack,
              ).copyWith(fontSize: 16, height: 1.625, letterSpacing: -0.02),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              color: const Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }

  void _showCountryDialog() {
    final countries = ['India', 'United States', 'United Kingdom', 'Canada'];
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColor.pureWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Country',
              style: AppTextStyles.kInterTextStyle16with600(
                AppColor.pureBlack,
              ).copyWith(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ...countries.map((country) {
              return ListTile(
                title: Text(country),
                onTap: () {
                  controller.selectedCountry.value = country;
                  Get.back();
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void _showStateDialog() {
    final states = ['IL', 'NY', 'CA', 'TX', 'FL'];
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColor.pureWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select State',
              style: AppTextStyles.kInterTextStyle16with600(
                AppColor.pureBlack,
              ).copyWith(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ...states.map((state) {
              return ListTile(
                title: Text(state),
                onTap: () {
                  controller.selectedState.value = state;
                  Get.back();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
