import 'package:flutter/material.dart';

class PagerIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const PagerIndicator({
    super.key,
    required this.currentIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalPages,
        (index) => _buildDot(index == currentIndex),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 10 : 6,
      height: isActive ? 10 : 6,
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFFAFBFC)
            : const Color(0xFFFAFBFC).withOpacity(0.5),
        shape: BoxShape.circle,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.4),
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ]
            : null,
      ),
    );
  }
}
