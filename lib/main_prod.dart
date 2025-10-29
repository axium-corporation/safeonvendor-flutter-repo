import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get_storage/get_storage.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:safeonvendor_flutter_repo/main_dev.dart";
import "package:safeonvendor_flutter_repo/presentation/app.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  initializeDateFormatting("en");
  final Map<String, Map<String, String>> language = await init();

  runApp(MyApp(language: language));
}
