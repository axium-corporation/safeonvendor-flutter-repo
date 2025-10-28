import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/auth/auth_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/auth/login_screen.dart";

List<GetPage<dynamic>>? getPages = [
  /* --------------------------------- Auth --------------------------------- */
  GetPage(
    name: Routes.loginScreenRoute,
    page: () => const LoginScreen(),
    binding: AuthBinding(),
  ),

  /* --------------------------------- Home --------------------------------- */
];

class Routes {
  /* --------------------------------- Auth --------------------------------- */
  static String loginScreenRoute = "/LoginScreen";

  /* --------------------------------- Home --------------------------------- */
  static String splashRoute = "/";
}
