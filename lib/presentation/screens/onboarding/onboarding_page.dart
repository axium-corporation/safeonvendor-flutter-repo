import 'package:flutter/material.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/onboarding/onboarding_screen_1.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/onboarding/onboarding_screen_2.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages/onboarding/onboarding_screen_3.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to login or home screen
      // Get.offNamed('/login');
      // print('Navigate to login screen');
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          OnboardingScreen1(onContinue: _onContinue),
          OnboardingScreen2(onContinue: _onContinue),
          OnboardingScreen3(onContinue: _onContinue),
        ],
      ),
    );
  }
}
