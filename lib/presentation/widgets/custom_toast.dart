import "package:flutter/material.dart";
import "package:flutter_tabler_icons/flutter_tabler_icons.dart";
import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/app/config/app_colors.dart";
import "package:safeonvendor_flutter_repo/app/config/app_text_styles.dart";
import "package:safeonvendor_flutter_repo/app/extension/ontap_debounce.dart";
import "package:safeonvendor_flutter_repo/app/util/responsive.dart";

import "package:toastification/toastification.dart";

void showCustomToastMessages({
  required String message,
  required bool isSuccess,
}) {
  CooldownManager.delayTap("ShowingToast", () {
    toastification.show(
      context: Get.context,
      type: _getToastType(isSuccess),
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: _buildTitle(isSuccess),
      description: _buildDescription(message),
      alignment: Responsive.isMobile(Get.context!)
          ? Alignment.topCenter
          : Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 400),
      animationBuilder: _buildAnimation,
      icon: _buildIcon(isSuccess),
      showIcon: false,
      primaryColor: _getToastColor(isSuccess),
      backgroundColor: _getToastColor(isSuccess),
      foregroundColor: AppColor.colorOne,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: _buildBoxShadow(isSuccess),
      showProgressBar: false,
      closeButton: _buildCloseButton(),
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: _buildCallbacks(),
    );
  });
}

ToastificationType _getToastType(bool isSuccess) {
  return isSuccess ? ToastificationType.success : ToastificationType.error;
}

Text _buildTitle(bool isSuccess) {
  return Text(
    isSuccess ? "Success".tr : "Error".tr,
    style: AppTextStyles.kColorTextStyle12with700(AppColor.pureWhite),
  );
}

Text _buildDescription(String message) {
  return Text(
    message,
    style: AppTextStyles.kColorTextStyle12with700(AppColor.pureWhite),
  );
}

Widget _buildAnimation(
  BuildContext context,
  Animation<double> animation,
  Alignment alignment,
  Widget child,
) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: Responsive.isMobile(context) ? Offset(0, -1) : Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
    child: GestureDetector(onPanUpdate: _handlePanUpdate, child: child),
  );
}

void _handlePanUpdate(DragUpdateDetails details) {
  if (details.delta.dy < -5) {
    debugPrint("Swipe up detected - dismissing toast");
    toastification.dismissAll();
  }
}

Icon _buildIcon(bool isSuccess) {
  return Icon(
    isSuccess ? TablerIcons.check : TablerIcons.x,
    color: AppColor.pureWhite,
    size: 20,
  );
}

Color _getToastColor(bool isSuccess) {
  return isSuccess ? AppColor.colorOne : AppColor.red;
}

List<BoxShadow> _buildBoxShadow(bool isSuccess) {
  return [
    BoxShadow(
      color: _getToastColor(isSuccess),
      blurRadius: 12,
      offset: const Offset(0, 4),
      spreadRadius: 2,
    ),
  ];
}

ToastCloseButton _buildCloseButton() {
  return ToastCloseButton(
    buttonBuilder: (context, onClose) {
      return GestureDetector(
        onTap: () {
          debugPrint("Close button tapped - dismissing toast");
          onClose();
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColor.pureWhite.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(TablerIcons.x, color: AppColor.pureWhite, size: 14),
        ),
      );
    },
  );
}

ToastificationCallbacks _buildCallbacks() {
  return ToastificationCallbacks(
    onTap: (toastItem) => debugPrint("Toast ${toastItem.id} tapped"),
    onCloseButtonTap: (toastItem) {
      debugPrint("Toast ${toastItem.id} close button tapped");
      toastification.dismissAll();
    },
    onAutoCompleteCompleted: (toastItem) =>
        debugPrint("Toast ${toastItem.id} auto complete completed"),
    onDismissed: (toastItem) => debugPrint("Toast ${toastItem.id} dismissed"),
  );
}
