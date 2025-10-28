import "dart:async";
import "package:connectivity_plus/connectivity_plus.dart";
import "package:get/get.dart";

class InternetConnectionController extends GetxController {
  RxBool hasInternet = false.obs;
  Timer? timer;
  RxBool showConnectedMessage = false.obs;

  @override
  void onInit() {
    super.onInit();
    startInternetCheck();
  }

  void startInternetCheck() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      checkInternetConnection();
    });
  }

  Future<void> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      hasInternet.value = true;
    } else {
      hasInternet.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }
}
