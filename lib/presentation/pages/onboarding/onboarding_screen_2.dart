import 'package:flutter/material.dart';
import 'widgets/onboarding_footer.dart';

class OnboardingScreen2 extends StatelessWidget {
  final VoidCallback onContinue;

  const OnboardingScreen2({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_bg_2.png',
              fit: BoxFit.cover,
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
                // Title and Subtitle
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Advanced Smoke Detectors',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          height: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'We stock products from industry-leading manufacturers.',
                        style: TextStyle(
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
                const SizedBox(height: 150),
                // Footer
                OnboardingFooter(
                  currentIndex: 1,
                  totalPages: 3,
                  onContinue: onContinue,
                ),
              ],
            ),
          ),
          // Home Indicator
          Positioned(
            bottom: 0,
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
}
