import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/app/config/app_colors.dart";

class PasswordVisibilityToggle extends StatelessWidget {
  final RxBool isPasswordEmpty;
  final RxBool obscure;

  const PasswordVisibilityToggle({
    required this.isPasswordEmpty,
    required this.obscure,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isPasswordEmpty.value) {
        return const SizedBox.shrink();
      }

      return IconButton(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) =>
              ScaleTransition(scale: anim, child: child),
          child: obscure.value
              ? Icon(
                  Icons.visibility_off,
                  key: const ValueKey("icon_hide"),
                  color: AppColor.buttonGrey,
                  size: 22,
                )
              : Icon(
                  Icons.visibility,
                  key: const ValueKey("icon_show"),
                  color: AppColor.buttonGrey,
                  size: 22,
                ),
        ),
        onPressed: () => obscure.value = !obscure.value,
      );
    });
  }
}
