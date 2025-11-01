import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/address_controller.dart';

class AddressScreen extends GetView<AddressController> {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      onTap: () => Get.back(),
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

          // Tabs
          Obx(() => _buildTabs()),

          // Add New Address Button
          Padding(
            padding: const EdgeInsets.only(top: 17, bottom: 25),
            child: GestureDetector(
              onTap: () {
                controller.clearForm();
                controller.navigateToAddAddress();
              },
              child: Container(
                width: 171,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.homePrimary, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+',
                      style: AppTextStyles.kInterTextStyle14with500(
                        AppColor.homePrimary,
                      ).copyWith(fontSize: 27, height: 1.5),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Add  New Address',
                      style: AppTextStyles.kInterTextStyle14with500(
                        AppColor.homePrimary,
                      ).copyWith(height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Address List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.homePrimary),
                );
              }

              final addresses = controller.addresses;

              if (addresses.isEmpty) {
                return Center(
                  child: Text(
                    'No addresses found',
                    style: AppTextStyles.kInterTextStyle16with400(
                      const Color(0xFF999999),
                    ),
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                  bottom: 120,
                ),
                itemCount: addresses.length,
                separatorBuilder: (context, index) => const SizedBox(height: 9),
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return _buildAddressCard(address);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.only(top: 17),
      child: Row(
        children: [
          const SizedBox(width: 18),
          // Billing Address Tab
          GestureDetector(
            onTap: () => controller.selectTab(0),
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Billing Address',
                      style: AppTextStyles.kInterTextStyle14with500(
                        AppColor.pureBlack,
                      ).copyWith(height: 1.5),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 98,
                      height: 4,
                      decoration: BoxDecoration(
                        color: controller.selectedTab.value == 0
                            ? AppColor.homePrimary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(width: 52),
          // Shipping Address Tab
          GestureDetector(
            onTap: () => controller.selectTab(1),
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Address',
                      style: AppTextStyles.kInterTextStyle14with500(
                        AppColor.pureBlack,
                      ).copyWith(height: 1.5),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 98,
                      height: 4,
                      decoration: BoxDecoration(
                        color: controller.selectedTab.value == 1
                            ? AppColor.homePrimary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(Map<String, dynamic> address) {
    final addressId = address['id'] as int;
    final isDefault = address['isDefault'] == true;

    return Container(
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: AppColor.pureWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 19,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      address['name'] ?? '',
                      style: AppTextStyles.kInterTextStyle16with600(
                        AppColor.pureBlack,
                      ).copyWith(
                        fontSize: 18,
                        height: 1.17,
                        letterSpacing: -0.01,
                      ),
                    ),
                  ),
                  // Menu button
                  GestureDetector(
                    onTap: () => controller.toggleDropdown(addressId),
                    child: Container(
                      width: 18,
                      height: 19,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFEFEF),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.more_vert,
                        size: 12,
                        color: const Color(0xFF655E5E),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 3),

              Text(
                '${address['houseNo'] ?? ''}\n${address['landmark'] ?? ''}\n${address['city'] ?? ''}, ${address['state'] ?? ''} ${address['zip'] ?? ''}',
                style: AppTextStyles.kInterTextStyle14with400(AppColor.pureBlack)
                    .copyWith(
                      fontSize: 18,
                      height: 1.44,
                      letterSpacing: -0.01,
                    ),
              ),

              // Dropdown menu
              Obx(() {
                if (!controller.isDropdownShown(addressId)) {
                  return const SizedBox.shrink();
                }

                return Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                    color: AppColor.pureWhite,
                    border: Border.all(
                      color: AppColor.homePrimary.withValues(alpha: 0.35),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.toggleDropdown(addressId);
                          controller.navigateToEditAddress(address);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'Edit',
                            style: AppTextStyles.kInterTextStyle12with400(
                              AppColor.pureBlack,
                            ).copyWith(fontSize: 10, height: 0.27),
                          ),
                        ),
                      ),
                      const SizedBox(height: 17),
                      GestureDetector(
                        onTap: () {
                          controller.toggleDropdown(addressId);
                          controller.deleteAddress(addressId);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'Remove ',
                            style: AppTextStyles.kInterTextStyle12with400(
                              AppColor.pureBlack,
                            ).copyWith(fontSize: 10, height: 0.27),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),

          // Default Badge
          if (isDefault)
            Positioned(
              top: 8,
              left: 24,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF7FBDE7),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Text(
                  'Default',
                  style: AppTextStyles.kInterTextStyle12with400(
                    const Color(0xFF024867),
                  ).copyWith(height: 1.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
