import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get_storage/get_storage.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:safeonvendor_flutter_repo/app/util/api_endpoint.dart";
import "package:safeonvendor_flutter_repo/app/util/util.dart";
import "package:safeonvendor_flutter_repo/presentation/app.dart";

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Get environment variables from dart-define
  const String apiBaseUrl = String.fromEnvironment(
    "API_BASE_URL",
    defaultValue: "Empty",
  );
  const String xApiKey = String.fromEnvironment(
    "X_API_KEY",
    defaultValue: "Empty",
  );
  const String s3BucketUrl = String.fromEnvironment(
    "S3BUCKETURL",
    defaultValue: "Empty",
  );
  const String googlePlacesApiKey = String.fromEnvironment(
    "GOOGLE_PLACES_API_KEY",
    defaultValue: "Empty",
  );
  APIEndpoint.baseUrl = apiBaseUrl;
  Utils.s3URL = s3BucketUrl;
  Utils.xApiKey = xApiKey;
  Utils.googlePlacesApiKey = googlePlacesApiKey;
  initializeDateFormatting("en");
  final Map<String, Map<String, String>> language = await init();

  runApp(MyApp(language: language));
}

Future<Map<String, Map<String, String>>> init() async {
  return {};
}
