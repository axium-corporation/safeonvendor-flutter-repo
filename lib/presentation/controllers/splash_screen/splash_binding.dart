import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/internet_connection.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/language_controller.dart";

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => AuthenticationRepositoryIml());
    Get.lazyPut(() => InternetConnectionController());
    Get.put(LanguageController(), permanent: true);
  }
}
