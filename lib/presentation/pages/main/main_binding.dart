import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/cart/cart_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/categories/categories_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/home/home_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/main_controller.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/profile/profile_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CategoriesController>(() => CategoriesController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
