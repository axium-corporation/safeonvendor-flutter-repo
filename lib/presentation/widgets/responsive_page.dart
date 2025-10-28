import "package:flutter/material.dart";
import "package:safeonvendor_flutter_repo/app/util/responsive.dart";

class ResponsivePage extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;

  const ResponsivePage({
    required this.desktop,
    required this.mobile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) return desktop;
    return mobile;
  }
}
