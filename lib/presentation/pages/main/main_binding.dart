import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/home/home_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

