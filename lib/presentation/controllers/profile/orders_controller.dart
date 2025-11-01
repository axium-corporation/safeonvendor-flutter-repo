import 'package:get/get.dart';

class OrdersController extends GetxController {
  // Observable variables
  final isLoading = false.obs;
  final orders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  // Load orders
  void loadOrders() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 500));

      // Dummy orders data
      orders.value = [
        {
          'id': 1,
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '4days ago',
          'rating': 4.5,
          'imageUrl': 'assets/images/products/fire_detector.png',
        },
        {
          'id': 2,
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '8 days ago',
          'rating': 4.0,
          'imageUrl': 'assets/images/products/fire_extinguisher.png',
        },
        {
          'id': 3,
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '10 days ago',
          'rating': 4.5,
          'imageUrl': 'assets/images/products/placeholder.png',
        },
        {
          'id': 4,
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '14 days ago',
          'rating': 5.0,
          'imageUrl': 'assets/images/products/fire_sprinkler.png',
        },
        {
          'id': 5,
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '15 days ago',
          'rating': 4.0,
          'imageUrl': 'assets/images/products/safety_jacket.png',
        },
        {
          'id': 6,
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '20 days ago',
          'rating': 4.5,
          'imageUrl': 'assets/images/products/emergency_light.png',
        },
      ];

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}

