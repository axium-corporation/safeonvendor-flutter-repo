import 'package:flutter/material.dart';
import 'widgets/onboarding_footer.dart';

class OnboardingScreen1 extends StatelessWidget {
  final VoidCallback onContinue;

  const OnboardingScreen1({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_bg_1.png',
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
                    const Color(0xFF061023).withOpacity(0.0),
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
                // Status Bar (9:41, signal, wifi, battery)
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '9:41',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1.0,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          // Mobile Signal
                          SizedBox(
                            width: 18,
                            height: 10,
                            child: Stack(
                              children: [
                                _buildSignalBar(0, 3, 4),
                                _buildSignalBar(4, 3, 6),
                                _buildSignalBar(8, 3, 8),
                                _buildSignalBar(12, 3, 10),
                              ],
                            ),
                          ),
                          const SizedBox(width: 3),
                          // Wifi Icon
                          Icon(Icons.wifi, size: 15, color: Colors.white),
                          const SizedBox(width: 5),
                          // Battery Icon
                          Icon(
                            Icons.battery_full,
                            size: 27,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Title and Subtitle
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Top-Quality Fire Extinguishers',
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
                  currentIndex: 0,
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
                    color: Colors.white.withOpacity(0.3),
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

  Widget _buildSignalBar(double left, double width, double height) {
    return Positioned(
      left: left,
      bottom: 0,
      child: Container(
        width: width.toDouble(),
        height: height.toDouble(),
        decoration: BoxDecoration(
          color: const Color(0xFFDADADA),
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
}
