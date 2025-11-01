import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/controllers/filter/filter_controller.dart';

class FilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterController>(() => FilterController());
  }
}

