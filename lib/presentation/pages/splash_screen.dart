import "dart:math";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/app/config/app_colors.dart";
import "package:safeonvendor_flutter_repo/app/config/app_text_styles.dart";
import "package:safeonvendor_flutter_repo/app/lang/translation_service.dart";
import "package:safeonvendor_flutter_repo/app/util/util.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/internet_connection.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/splash_screen/splash_controller.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController splashController = Get.put(SplashController());

  final InternetConnectionController internetController = Get.put(
    InternetConnectionController(),
  );

  @override
  void initState() {
    splashController.startTimer(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.buttonGrey,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Text(
            "Powered by VesperonTech",
            style: AppTextStyles.kColorTextStyle16with400(AppColor.pureWhite),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(child: FadingCircularProgress()),
    );
  }
}

class FadingCircularProgress extends StatefulWidget {
  const FadingCircularProgress({super.key});

  @override
  State<FadingCircularProgress> createState() => _FadingCircularProgressState();
}

class _FadingCircularProgressState extends State<FadingCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utils().printColored(
      "TranslationService.locale: ${TranslationService.locale}",
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        // Static center logo
        SizedBox(
          width: 244,
          height: 244,
          child: Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 182,
              height: 100,
            ),
          ),
        ),

        // Rotating arc circle
        SizedBox(
          width: 244,
          height: 244,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..scaleByDouble(-1, 1, 1, 1) // Mirror on Y-axis
                  ..rotateZ(-_controller.value * 2 * pi), // Still clockwise
                alignment: Alignment.center,
                child: CustomPaint(painter: _FadingCirclePainter()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FadingCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 2.0;
    final radius = (size.width - strokeWidth) / 2;

    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: radius,
    );
    final gradient = SweepGradient(
      // startAngle: 0,
      // endAngle: 2 * pi,
      colors: [
        AppColor.lightBlue,
        AppColor.lightBlue.withValues(alpha: 0.4),
        Colors.transparent,
      ],
      stops: const [0.0, 0.5, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
