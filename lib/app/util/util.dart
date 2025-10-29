import "dart:developer";

import "package:flutter/foundation.dart";
import "package:get/get.dart";
import "package:url_launcher/url_launcher.dart";

class Utils {
  static String? s3URL;
  static String? xApiKey;

  static String? acessToken;
  static String? refreshToken;
  static String? isProfileCompleted;
  static String? googlePlacesApiKey;
  static bool? isOldCareTaker;
  /*---------------------------------Validate Email---------------------------------*/
  static RxBool isSwitched = false.obs;
  static RxInt refreshTime = 0.obs;
  /*---------------------------------Validate Email---------------------------------*/
  static bool isEmailValid(String value) {
    const String pattern =
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
    final RegExp regExp = RegExp(pattern, caseSensitive: false);

    return regExp.hasMatch(value);
  }

  /*---------------------------------Validate Email---------------------------------*/
  /*---------------------------------Validate Phone Number---------------------------------*/
  static bool isPhoneValid(String value) {
    final RegExp regExp = RegExp(r'^[0-9]{10}$');
    return regExp.hasMatch(value);
  }
  /*---------------------------------Validate Password---------------------------------*/

  // Validate Password
  static String? validatePasswordFormat(String value) {
    if (value.isEmpty) {
      return "loginPage_validation_passwordIsRequired".tr;
    }
    if (value.length < 8) {
      return "password_must_be_atleast_8_characters".tr;
    }
    if (!RegExp("[A-Z]").hasMatch(value)) {
      return "password_must_contain_a_upper_case".tr;
    }
    if (!RegExp("[a-z]").hasMatch(value)) {
      return "password_must_contain_a_lower_case".tr;
    }
    if (!RegExp("[0-9]").hasMatch(value)) {
      return "password_must_contain_a_number".tr;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "password_must_contain_a_special_character".tr;
    }
    return null;
  }

  void printColored(String text, {String color = PrintColor.green}) {
    const reset = "\x1B[0m"; // Reset text color
    const int chunkSize =
        800; // Flutter's debugPrint truncates at 800 characters

    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < text.length; i += chunkSize) {
      final chunk = text.substring(
        i,
        i + chunkSize > text.length ? text.length : i + chunkSize,
      );
      buffer.write("$color$chunk$reset");
    }

    if (kDebugMode) {
      log(buffer.toString());
    }
  }

  /*---------------------------------Gender Helper---------------------------------*/

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url.startsWith("http") ? url : "https://$url");
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint("Failed to launch $uri");
    }
  }

  // Translation Reuse
}

class PrintColor {
  static const String black = "\x1B[30m";
  static const String red = "\x1B[31m";
  static const String green = "\x1B[32m";
  static const String yellow = "\x1B[33m";
  static const String blue = "\x1B[34m";
  static const String magenta = "\x1B[35m";
  static const String cyan = "\x1B[36m";
  static const String white = "\x1B[37m";

  // Bright versions
  static const String brightBlack = "\x1B[90m";
  static const String brightRed = "\x1B[91m";
  static const String brightGreen = "\x1B[92m";
  static const String brightYellow = "\x1B[93m";
  static const String brightBlue = "\x1B[94m";
  static const String brightMagenta = "\x1B[95m";
  static const String brightCyan = "\x1B[96m";
  static const String brightWhite = "\x1B[97m";

  // Background colors
  static const String bgBlack = "\x1B[40m";
  static const String bgRed = "\x1B[41m";
  static const String bgGreen = "\x1B[42m";
  static const String bgYellow = "\x1B[43m";
  static const String bgBlue = "\x1B[44m";
  static const String bgMagenta = "\x1B[45m";
  static const String bgCyan = "\x1B[46m";
  static const String bgWhite = "\x1B[47m";
}
