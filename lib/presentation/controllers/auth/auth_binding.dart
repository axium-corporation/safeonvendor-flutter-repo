import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/auth/auth_controller.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/language_controller.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/main_controller.dart";

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => AuthenticationRepositoryIml());
    // Get.lazyPut(() => InternetConnectionController());
    // Get.lazyPut(() => AuthUseCase(Get.find<AuthenticationRepositoryIml>()));
    // Get.put(AuthController(Get.find()), permanent: true);
    // Get.lazyPut(() => AuthController(Get.find<AuthUseCase>()));
    Get.lazyPut(() => AuthController());

    Get.put(LanguageController(), permanent: true);
    // Home
    Get.lazyPut(() => MainController());
  }
}
