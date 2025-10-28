import "package:flutter/material.dart";
import "package:safeonvendor_flutter_repo/app/config/app_colors.dart";
import "package:skeletonizer/skeletonizer.dart";

class ReusableSkeleton extends StatelessWidget {
  final bool enabled;
  final double? height;
  final double? width;
  final bool ignoreContainers;
  final Widget? child;
  final double? radius;

  const ReusableSkeleton({
    required this.enabled,
    required this.ignoreContainers,
    this.height,
    this.width,
    this.child,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: AppColor.pureWhite.withValues(alpha: 0.1),
        highlightColor: AppColor.lightBlue.withValues(alpha: 0.3),
        duration: const Duration(milliseconds: 1200),
      ),

      enabled: enabled,
      ignoreContainers: ignoreContainers,
      child:
          child ??
          Container(
            height: height,
            width: width,
            color: AppColor.pureWhite.withValues(alpha: 0.1),
          ),
    );
  }
}
