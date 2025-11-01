import 'package:get/get.dart';

class NotificationsController extends GetxController {
  // Observable variables
  final isLoading = false.obs;
  final selectedTab = 0.obs; // 0 = Orders, 1 = Offers
  final notifications = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  // Load notifications
  Future<void> loadNotifications() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Dummy notifications data
      notifications.value = [
        {
          'id': 1,
          'imageUrl': 'assets/images/products/smoke_detector_1.png',
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '4days ago',
        },
        {
          'id': 2,
          'imageUrl': 'assets/images/products/smoke_detector_2.png',
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '4days ago',
        },
        {
          'id': 3,
          'imageUrl': 'assets/images/products/fire_detector_1.png',
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '4days ago',
        },
        {
          'id': 4,
          'imageUrl': 'assets/images/products/smoke_detector_3.png',
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '4days ago',
        },
        {
          'id': 5,
          'imageUrl': 'assets/images/products/fire_detector_2.png',
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '4days ago',
        },
        {
          'id': 6,
          'imageUrl': 'assets/images/products/smoke_detector_4.png',
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '4days ago',
        },
        {
          'id': 7,
          'imageUrl': 'assets/images/products/fire_sprinkler.png',
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '4days ago',
        },
        {
          'id': 8,
          'imageUrl': 'assets/images/products/fire_icon.png',
          'message': 'Deliverd:Your package was successfully deliverd.',
          'time': '4days ago',
        },
      ];
      
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  // Switch tab
  void changeTab(int index) {
    selectedTab.value = index;
  }
}

