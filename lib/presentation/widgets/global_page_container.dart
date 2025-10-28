import 'package:flutter/material.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';

class GlobalPageContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;

  const GlobalPageContainer({
    super.key,
    required this.child,
    this.padding,
    this.alignment,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.whiteBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: padding ?? const EdgeInsets.all(12),
      alignment: alignment,
      child: child,
    );
  }
}

class GlobalListTileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;
  final Color? backgroundColor;
  final double borderRadius;

  const GlobalListTileCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.actions,
    this.backgroundColor,
    this.borderRadius = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: backgroundColor ?? AppColor.whiteBackground,
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.kColorTextStyle14with500(AppColor.textBlack),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.kColorTextStyle14with500(AppColor.textGrey),
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: actions),
      ),
    );
  }
}
