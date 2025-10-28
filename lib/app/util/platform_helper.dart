import "dart:io" show Platform;
import "package:flutter/foundation.dart";

class PlatformHelper {
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isWeb => kIsWeb;
}
