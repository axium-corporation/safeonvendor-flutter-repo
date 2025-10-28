import 'package:flutter/material.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';

class LightGreenBoxSquare extends StatelessWidget {
  final Widget child;
  const LightGreenBoxSquare({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColor.colorOne.withValues(alpha: 0.12),
            AppColor.colorOne.withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColor.colorOne.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: child,
    );
  }
}

class LightGreenBoxRectangular extends StatelessWidget {
  final Widget child;
  const LightGreenBoxRectangular({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.colorOne.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
