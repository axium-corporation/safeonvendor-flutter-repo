import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/auth/auth_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/auth/login_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/auth/register_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/auth/otp_screen.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/onboarding/onboarding_page.dart";

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
}
