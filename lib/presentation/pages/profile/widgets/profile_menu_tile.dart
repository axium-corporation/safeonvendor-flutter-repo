import 'package:flutter/material.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String? trailing;
  final bool showDivider;

  const ProfileMenuTile({
    super.key,
    required this.title,
    required this.onTap,
    this.trailing,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColor.pureWhite,
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          children: [
            Container(
              height: 42.5,
              padding: const EdgeInsets.only(left: 0.5, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.kInterTextStyle16with400(
                        AppColor.pureBlack,
                      ).copyWith(height: 1.2102272510528564),
                    ),
                  ),
                  // Trailing (country/language value or arrow)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (trailing != null) ...[
                        Text(
                          trailing!,
                          style: AppTextStyles.kNunitoSansTextStyle14with600(
                            AppColor.pureBlack,
                          ).copyWith(fontSize: 15, height: 1.3639999389648438),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(width: 6),
                      ],
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColor.pureBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Divider
            if (showDivider)
              Container(
                height: 1,
                color: AppColor.pureBlack.withValues(alpha: 0.1),
              ),
          ],
        ),
      ),
    );
  }
}
