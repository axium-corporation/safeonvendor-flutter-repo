import "package:flutter/foundation.dart";

class CooldownManager {
  static final Map<String, DateTime> _lastTapTimes = {};

  static void delayTap(
    String key,
    VoidCallback action, {
    int cooldownInSeconds = 3,
  }) {
    final DateTime now = DateTime.now();

    if (!_lastTapTimes.containsKey(key) ||
        now.difference(_lastTapTimes[key]!).inSeconds >= cooldownInSeconds) {
      _lastTapTimes[key] = now;
      action();
    } else {
      if (kDebugMode) {
        print("Tap ignored, cooldown in progress");
      }
    }
  }
}
