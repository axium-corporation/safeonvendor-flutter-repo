import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/about_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/address_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/country_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/language_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/notifications_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/orders_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/profile_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/settings_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/terms_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/wishlist_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<WishlistController>(() => WishlistController());
    Get.lazyPut<AboutController>(() => AboutController());
    Get.lazyPut<TermsController>(() => TermsController());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<AddressController>(() => AddressController());
    Get.lazyPut<OrdersController>(() => OrdersController());
    Get.lazyPut<LanguageSelectionController>(() => LanguageSelectionController());
    Get.lazyPut<CountryController>(() => CountryController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}

