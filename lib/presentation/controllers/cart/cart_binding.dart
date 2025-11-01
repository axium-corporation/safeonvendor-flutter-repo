import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}

