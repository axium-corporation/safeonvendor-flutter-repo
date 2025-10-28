import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_colors.dart';
import 'package:safeonvendor_flutter_repo/app/config/app_text_styles.dart';
import 'package:safeonvendor_flutter_repo/presentation/widgets/empty_space.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onSubmit,
    required this.isLoading,
    required this.buttonText,
  });
  final VoidCallback onSubmit;
  final bool isLoading;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF6d9773),
          padding: const EdgeInsets.symmetric(vertical: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onSubmit,
        child: isLoading == true
            ? CupertinoActivityIndicator(color: AppColor.pureWhite)
            : Text(
                buttonText,
                textAlign: TextAlign.center,
                style: AppTextStyles.kColorTextStyle15with500(
                  AppColor.pureWhite,
                ),
              ),
      ),
    );
  }
}

class GloabalBottomTwoButtons extends StatelessWidget {
  final String cancelText;
  final String confirmText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const GloabalBottomTwoButtons({
    super.key,
    this.cancelText = "Cancel",
    this.confirmText = "Confirm",
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: AppColor.colorOne),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                cancelText,
                style: AppTextStyles.kColorTextStyle15with500(
                  AppColor.colorOne,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.colorOne,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                confirmText,
                style: AppTextStyles.kColorTextStyle15with500(
                  AppColor.pureWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget smallActionButton({
  required IconData icon,
  required VoidCallback onTap,
  required Color color,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: AppColor.pureWhite, size: 16),
    ),
  );
}

// ---------- Modern Submit Button --------------------------
class ModernSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String buttonText;
  final IconData? icon;

  const ModernSubmitButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.buttonText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.colorOne, AppColor.colorOne.withValues(alpha: 0.8)],
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColor.colorOne.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(14),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CupertinoActivityIndicator(
                      color: AppColor.pureWhite,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonText,
                        style: AppTextStyles.kColorTextStyle16with600(
                          AppColor.pureWhite,
                        ),
                      ),
                      8.width,
                      if (icon != null)
                        Icon(icon!, color: AppColor.pureWhite, size: 20),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class ModernContactButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const ModernContactButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradientColors[0].withValues(alpha: 0.3),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColor.pureWhite, size: 28),
            12.height,
            Text(
              title,
              style: AppTextStyles.kColorTextStyle14with600(AppColor.pureWhite),
            ),
            4.height,
            Text(
              subtitle,
              style: AppTextStyles.kColorTextStyle12with400(
                AppColor.pureWhite.withValues(alpha: 0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
