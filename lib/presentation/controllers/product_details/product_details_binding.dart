import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/product_details/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
  }
}

