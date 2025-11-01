import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/categories/categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(() => CategoriesController());
  }
}
