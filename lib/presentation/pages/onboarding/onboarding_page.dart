import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeonvendor_flutter_repo/presentation/pages.dart';
import 'widgets/onboarding_footer.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      image: 'assets/images/onboarding_bg_1.png',
      title: 'Top-Quality Fire Extinguishers',
      subtitle: 'We stock products from industry-leading manufacturers.',
    ),
    OnboardingData(
      image: 'assets/images/onboarding_bg_2.png',
      title: 'Advanced Smoke Detectors',
      subtitle: 'We stock products from industry-leading manufacturers.',
    ),
    OnboardingData(
      image: 'assets/images/onboarding_bg_3.png',
      title: 'Trusted Brands &\nmanufacturers',
      subtitle: 'We stock products from industry-leading manufacturers.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offNamed(Routes.loginScreenRoute);
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
      body: Stack(
        children: [
          // PageView with smooth transitions
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return _buildOnboardingPage(index);
            },
          ),
          // Persistent Footer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: OnboardingFooter(
              currentIndex: _currentPage,
              totalPages: _onboardingData.length,
              onContinue: _onContinue,
            ),
          ),
          // Home Indicator
          Positioned(
            bottom: 115,
            left: 0,
            right: 0,
            child: Container(
              width: 375,
              height: 34,
              margin: const EdgeInsets.only(bottom: 0),
              child: Center(
                child: Container(
                  width: 148,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(int index) {
    return Stack(
      children: [
        // Background Image (no animation to prevent flickering)
        Positioned.fill(
          child: Image.asset(
            _onboardingData[index].image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        // Gradient Overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xFF0071A4),
                  const Color(0xFF061023).withValues(alpha: 0.0),
                ],
                stops: const [0.16, 1.0],
              ),
            ),
          ),
        ),
        // Content
        SafeArea(
          child: Column(
            children: [
              const Spacer(),
              // Title and Subtitle (simple fade transition)
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 500),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _onboardingData[index].title,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                height: 1.5,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _onboardingData[index].subtitle,
                              style: const TextStyle(
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1.5,
                                color: Color(0xFFDFDFDF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ],
    );
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String subtitle;

  OnboardingData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
