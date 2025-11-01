import 'package:get/get.dart';

class TermsController extends GetxController {
  final isLoading = false.obs;
  
  final termsItems = [
    {'title': 'Terms of Use', 'route': '/terms-of-use'},
    {'title': 'Privacy Policy', 'route': '/privacy-policy'},
    {'title': 'Licence', 'route': '/licence'},
    {'title': 'Return Policy', 'route': '/return-policy'},
  ];
  
  void navigateToDetail(String title) {
    Get.snackbar('Navigate', 'Opening $title');
  }
}

