import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'pager_indicator.dart';

class OnboardingFooter extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onContinue;

  const OnboardingFooter({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 16, 30, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PagerIndicator(
                  currentIndex: currentIndex,
                  totalPages: totalPages,
                ),
                _buildContinueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFBFC),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onContinue,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF061023),
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  TablerIcons.arrow_right,
                  size: 16,
                  color: Color(0xFF061023),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
