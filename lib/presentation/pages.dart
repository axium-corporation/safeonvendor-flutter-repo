import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/auth/auth_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/filter/filter_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/home/home_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/product_details/product_details_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/profile/profile_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/search/search_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/auth/login_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/auth/register_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/auth/otp_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/filter/filter_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/home/home_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/main/main_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/main/main_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/onboarding/onboarding_page.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/product_details/product_details_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/about/about_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/address/add_address_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/address/address_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/country/country_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/language/language_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/notifications/notifications_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/orders/orders_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/settings/settings_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/terms/terms_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/profile/wishlist/wishlist_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/search/search_screen.dart";

List<GetPage<dynamic>>? getPages = [
  /* --------------------------------- Onboarding --------------------------------- */
  GetPage(name: Routes.onboardingPageRoute, page: () => const OnboardingPage()),

  /* --------------------------------- Auth --------------------------------- */
  GetPage(
    name: Routes.loginScreenRoute,
    page: () => const LoginScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: Routes.registerScreenRoute,
    page: () => const RegisterScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: Routes.otpScreenRoute,
    page: () => const OtpScreen(),
    binding: AuthBinding(),
  ),

  /* --------------------------------- Home --------------------------------- */
  GetPage(
    name: Routes.mainScreenRoute,
    page: () => const MainScreen(),
    binding: MainBinding(),
  ),
  GetPage(
    name: Routes.homeRoute,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),

  /* --------------------------------- Profile --------------------------------- */
  GetPage(
    name: Routes.wishlistRoute,
    page: () => const WishlistScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.aboutRoute,
    page: () => const AboutScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.termsRoute,
    page: () => const TermsScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.notificationsRoute,
    page: () => const NotificationsScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.addressRoute,
    page: () => const AddressScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.addAddressRoute,
    page: () => const AddAddressScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.ordersRoute,
    page: () => const OrdersScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.languageRoute,
    page: () => const LanguageScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.countryRoute,
    page: () => const CountryScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.settingsRoute,
    page: () => const SettingsScreen(),
    binding: ProfileBinding(),
  ),

  /* --------------------------------- Product Details --------------------------------- */
  GetPage(
    name: Routes.productDetailsRoute,
    page: () => const ProductDetailsScreen(),
    binding: ProductDetailsBinding(),
  ),

  /* --------------------------------- Search --------------------------------- */
  GetPage(
    name: Routes.searchRoute,
    page: () => const SearchScreen(),
    binding: SearchBinding(),
  ),

  /* --------------------------------- Filter --------------------------------- */
  GetPage(
    name: Routes.filterRoute,
    page: () => const FilterScreen(),
    binding: FilterBinding(),
  ),
];

class Routes {
  /* --------------------------------- Onboarding --------------------------------- */
  static String onboardingPageRoute = "/OnboardingPage";

  /* --------------------------------- Auth --------------------------------- */
  static String loginScreenRoute = "/LoginScreen";
  static String registerScreenRoute = "/RegisterScreen";
  static String otpScreenRoute = "/OtpScreen";

  /* --------------------------------- Home --------------------------------- */
  static String splashRoute = "/";
  static String mainScreenRoute = "/MainScreen";
  static String homeRoute = "/Home";

  /* --------------------------------- Profile --------------------------------- */
  static String wishlistRoute = "/wishlist";
  static String aboutRoute = "/about";
  static String termsRoute = "/terms";
  static String notificationsRoute = "/notifications";
  static String addressRoute = "/address";
  static String addAddressRoute = "/add-address";
  static String ordersRoute = "/orders";
  static String languageRoute = "/language";
  static String countryRoute = "/country";
  static String settingsRoute = "/settings";

  /* --------------------------------- Product Details --------------------------------- */
  static String productDetailsRoute = "/product-details";

  /* --------------------------------- Search --------------------------------- */
  static String searchRoute = "/search";

  /* --------------------------------- Filter --------------------------------- */
  static String filterRoute = "/filter";
}
