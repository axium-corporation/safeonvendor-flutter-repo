import "dart:async";

// import "package:flowx/app/util/api_endpoint.dart";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/presentation/pages.dart";

class SplashController extends GetxController {
  void startTimer(BuildContext context) {
    Future.delayed(const Duration(seconds: 20), () {
      _checkAccessToken();
    });
  }

  Future<void> _checkAccessToken() async {
    Get.offAllNamed(Routes.onboardingPageRoute);
  }

  // final bool isOnboardingComplete =
  //     await DataStorage.instance
  //         .getValue(DataStorage.onboardingComplete)
  //         .then((value) => value == "true") ??
  //     false;

  // if (isOnboardingComplete) {
  //   final String? accessToken = await DataStorage.instance.getValue(
  //     DataStorage.accessToken,
  //   );
  //   final String? refreshToken = await DataStorage.instance.getValue(
  //     DataStorage.refreshToken,
  //   );
  //   final String? isProfileCompleted = await DataStorage.instance.getValue(
  //     DataStorage.isProfileCompleted,
  //   );
  //   // final String? isOldCareTaker = await DataStorage.instance.getValue(
  //   //   DataStorage.isOldCareTaker,
  //   // );
  //   Utils().printColored(
  //     "accessToken: $accessToken",
  //     color: PrintColor.white,
  //   );
  //   Utils().printColored(
  //     "refreshToken: $refreshToken",
  //     color: PrintColor.white,
  //   );
  //   Utils().printColored(
  //     "isProfileCompleted: $isProfileCompleted",
  //     color: PrintColor.white,
  //   );
  //   // Utils().printColored(
  //   //   "isOldCareTaker: $isOldCareTaker",
  //   //   color: PrintColor.white,
  //   // );
  //   if (accessToken != null && isProfileCompleted == "true") {
  //     Utils.acessToken = accessToken;
  //     Utils.isProfileCompleted = isProfileCompleted;
  //     // Utils.isOldCareTaker = isOldCareTaker == "1";
  //     Utils.refreshToken = await DataStorage.instance.getValue(
  //       DataStorage.refreshToken,
  //     );
  //     // Utils.isOldCareTaker = await DataStorage.instance
  //     //     .getValue(DataStorage.isOldCareTaker)
  //     //     .then((value) => value == "1");

  //     Get.offAllNamed(Routes.landingScreenRoute);
  //   } else {
  //     Get.offNamed(Routes.loginScreenRoute);
  //   }

  //   //// Navigate to login if onboarding is done
  //   //  Get.offAllNamed(Routes.landingScreenRoute);
  // } else {
  //   Get.offAllNamed(Routes.onBordingScreenRoute); // Navigate to onboarding
  // }
}
