import "dart:developer";

import "package:flutter/foundation.dart";

class Log {
  static bool isDebugPrint = true;

  static dynamic printInfo(String msg) {
    defaultPrint("info", msg);
  }

  static dynamic defaultPrint(String printName, String msg) {
    if (isDebugPrint) {
      if (kDebugMode) {
        if (kIsWeb) {
          print("$printName|$msg");
        } else {
          log("$printName|$msg");
        }
      }
    }
  }
}
