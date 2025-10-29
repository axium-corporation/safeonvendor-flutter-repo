import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/app/lang/translation_service.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/splash_screen/splash_binding.dart";
import "package:safeonvendor_flutter_repo/presentation/pages.dart";
import "package:safeonvendor_flutter_repo/presentation/pages/splash_screen.dart";

import "package:toastification/toastification.dart";

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> language;
  const MyApp({required this.language, super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: GetMaterialApp(
          initialBinding: SplashBinding(),
          title: "Sylo",
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          // locale: const Locale("de", "DE"),
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(languages: language),
          localizationsDelegates: const [
            // CountryLocalizations.delegate,
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
          ],
          defaultTransition: Transition.noTransition,
          getPages: getPages,
          scrollBehavior: BouncingScrollBehavior(),
          supportedLocales: const [Locale("en", "US")],
        ),
      ),
    );
  }
}

class BouncingScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
