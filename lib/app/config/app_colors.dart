import "package:flutter/material.dart";

class AppColor {
  static Color pureWhite = Colors.white;
  static Color lightGreen = const Color(0xffEAFFE5);
  static Color laraTextColor = const Color(0xff495057);
  static Color laraInputBorder = const Color(0xffCED4DA);

  static Color bgGreen = const Color.fromARGB(255, 9, 228, 89);
  static Color surfaceColor = const Color(0xffEFF3F8);
  static Color tabviewHeaderBorderColor = const Color(0xffDEE2E6);
  static Color yellow = const Color(0xffFFBA00);
  static Color pink = const Color(0xffEA2B61);
  static Color blue = const Color(0xff4291EC);
  static Color textSecondaryColor = const Color(0xff6C757D);
  static Color surfaceBorder = const Color(0xffD9D9D9);
  static Color warningButtonHoverBorderColor = const Color(0xffD97706);
  static Color selectedDateBackgroundColor = const Color(0xffEFF6FF);

  static Color successMessageTextColor = const Color(0xff1EA97C);
  static Color errorMessageTextColor = const Color(0xFFCC8925);
  static Color surface900Color = const Color(0xFF212121);
  static Color calenderOrangecolor = const Color(0xFFFBA86F);
  static Color red = Colors.red;
  static Color pureBlack = Colors.black;

  // NEW
  static Color lightBlue = const Color(0xFF69A2B5);
  static Color buttonGrey = const Color(0xFF333333);
  static Color textGrey = const Color(0xFF6C7376);
  static Color bgGrey = const Color(0xFFF5F5F5);
  static Color dividerGrey = const Color(0xFFD1D1D1);
  static Color dividerGrey2 = const Color(0xFF3C3C43);
  static Color whiteBackground = const Color(0xFFFAFAFA);
  static Color thickBlackText = const Color(0xFF1A1A1A);
  static Color textGrey2 = const Color(0xFF666666);

  static const Color textBlack = Color(0xFF1A1A1A);
  static const Color primary = Color(0xFF6366F1);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFFF6B6B);
  static const Color borderGrey = Color(0xFFE1E1E1);
  static const Color lightBlue2 = Color(0xFFE8EDEF);
  static const Color sliderDotColor = Color(0xFFA6B3B9);

  //Auth Colors
  static const Color buttonColor = Color(0xFF6d9773);
  static const Color colorOne = Color(0xFF0C3B2E);

  // Auth specific colors from Figma
  static const Color authPrimary = Color(0xFF0071AF);
  static const Color authPrimaryAlt = Color(0xFF0071A4);
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray300 = Color(0xFFD2D5DA);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6D7280);

  // Home Screen Colors from Figma
  static const Color homePrimary = Color(0xFF0071A4);
  static const Color homeHeading = Color(0xFF202020);
  static const Color homeBackground = Color(0xFFF3F3F3);
  static const Color homeSearchBg = Color(0xFFF6F6F6);
  static const Color homeYellow1 = Color(0xFFF5AA0D);
  static const Color homeYellow2 = Color(0xFFF1B11C);
  static const Color homeYellow3 = Color(0xFFFFD471);
  static const Color homeSuccessGreen = Color(0xFF249B3E);
  static const Color homeStarYellow = Color(0xFFECA61B);
  static const Color homeTextGray = Color(0xFF666666);
  static const Color homeBadgeRed = Color(0xFFFF2D2D);
  static const Color homeBannerRed = Color(0xFFFF0000);
  static const Color homeLightBlue = Color(0xFFF3F9FB);
  static const Color homeBlue = Color(0xFF0042E0);
  static const Color homeBottomNavBg = Color(0xFF181725);
  static const Color homeBottomNavActive = Color(0xFF0071A4);
  static const Color homeBottomNavInactive = Color(0xFF181725);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    var hexxColor = hexColor.toUpperCase().replaceAll("#", "");

    if (hexxColor.length == 6) {
      hexxColor = "FF$hexxColor";
    }

    return int.parse(hexxColor, radix: 16);
  }

  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
}

class AppGradients {
  static const List<List<Color>> gradientColors = [
    [Color(0xFFff9a9e), Color(0xFFfad0c4)],
    [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
    [Color(0xFF84fab0), Color(0xFF8fd3f4)],
    [Color(0xFFfccb90), Color(0xFFd57eeb)],
  ];
}

class AppPalette {
  static const Color deepOrange = Colors.deepOrange;
  static const Color blue = Colors.blue;
  static const Color green = Colors.green;
  static const Color purple = Colors.purple;
  static const Color teal = Colors.teal;
  static const Color indigo = Colors.indigo;
  static const Color cyan = Colors.cyan;
  static const Color redAccent = Colors.redAccent;
  static const Color orange = Colors.orange;
  static const Color brown = Colors.brown;
  static const Color deepPurpleAccent = Colors.deepPurpleAccent;
  static const Color blueGrey = Colors.blueGrey;
  static const Color greenAccent = Colors.greenAccent;
  static const Color lightBlue = Colors.lightBlue;
  static const Color amber = Colors.amber;
  static const Color deepOrangeAccent = Colors.deepOrangeAccent;
  static const Color blueAccent = Colors.blueAccent;
  static const Color grey = Colors.grey;

  // List of all palette colors for easy iteration
  static const List<Color> allColors = [
    deepOrange,
    blue,
    green,
    purple,
    teal,
    indigo,
    cyan,
    redAccent,
    orange,
    brown,
    deepPurpleAccent,
    blueGrey,
    greenAccent,
    lightBlue,
    amber,
    deepOrangeAccent,
    blueAccent,
    grey,
  ];
}
