import "dart:convert";

import "package:connectivity_plus/connectivity_plus.dart";
import "package:dio/dio.dart";

import "package:fluttertoast/fluttertoast.dart";
import "package:get/get.dart" as getx;
import "package:safeonvendor_flutter_repo/app/config/app_colors.dart";
import "package:safeonvendor_flutter_repo/app/util/logger.dart";
import "package:safeonvendor_flutter_repo/app/util/util.dart";
import "package:safeonvendor_flutter_repo/data/providers/token_refresh_service.dart";
import "package:safeonvendor_flutter_repo/presentation/controllers/language_controller.dart";

class ApiHelper {
  static final Dio _dio = Dio();

  static Future<dynamic> get(String url) async {
    return _request(url, HttpMethod.get);
  }

  static Future<dynamic> post(String url, dynamic data) async {
    return _request(url, HttpMethod.post, data: data);
  }

  static Future<dynamic> put(String url, {dynamic data}) async {
    return _request(url, HttpMethod.put, data: data);
  }

  static Future<dynamic> patch(String url, {dynamic data}) async {
    return _request(url, HttpMethod.patch, data: data);
  }

  static Future<dynamic> delete(String url, dynamic data) async {
    return _request(url, HttpMethod.delete, data: data);
  }

  static Future<dynamic> postFormData(String url, FormData data) async {
    return _request(url, HttpMethod.postFormData, data: data);
  }

  static Future<dynamic> putFormData(String url, FormData data) async {
    return _request(url, HttpMethod.putFormData, data: data);
  }

  static Future<dynamic> patchFormData(String url, FormData data) async {
    return _request(url, HttpMethod.patch, data: data);
  }

  static Future<dynamic> _request(
    String url,
    HttpMethod method, {
    dynamic data,
    bool isRetry = false,
  }) async {
    try {
      final bool isConnected = await checkInternetConnectivity();
      if (!isConnected) {
        Fluttertoast.showToast(
          msg: "no_Internet_Connection".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.pureWhite,
          fontSize: 14,
        );
        return jsonEncode({
          "status": false,
          "message": "No Internet Connection",
        });
      }

      final response = await _makeHttpRequest(url, method, data);
      return response;
    } on DioException catch (dioError) {
      return _handleDioError(dioError, url, method, data, isRetry);
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> _makeHttpRequest(
    String url,
    HttpMethod method,
    dynamic data,
  ) async {
    final LanguageController languageController = getx.Get.find();

    Log.printInfo("x-access-key : ${Utils.xApiKey}");
    Log.printInfo("Bearer : ${Utils.acessToken}");

    final Map<String, String> headers = {
      "Accept-Language": languageController.selectedLanguage.value,
      // "Accept-Language": "de",
      "Accept": "*/*",
      "Authorization": "Bearer ${Utils.acessToken}",
      "Content-Type": "application/json",
      "x-api-key": Utils.xApiKey ?? "",
      "x-app-version": "1.0.0",
    };

    Utils().printColored("Headers: $headers", color: PrintColor.white);
    Log.printInfo("Url : $url");

    if (data != null) {
      printFormData(data);
    }

    Response response;
    switch (method) {
      case HttpMethod.get:
        response = await _dio.get(url, options: Options(headers: headers));

      case HttpMethod.post:
        response = await _dio.post(
          url,
          data: jsonEncode(data),
          options: Options(headers: headers),
        );

      case HttpMethod.postFormData:
        response = await _dio.post(
          url,
          data: data,
          options: Options(headers: headers),
        );

      case HttpMethod.putFormData:
        response = await _dio.put(
          url,
          data: data,
          options: Options(headers: headers),
        );

      case HttpMethod.delete:
        response = await _dio.delete(url, options: Options(headers: headers));

      case HttpMethod.patch:
        response = await _dio.patch(
          url,
          data: data,
          options: Options(headers: headers),
        );

      case HttpMethod.put:
        response = await _dio.put(
          url,
          data: jsonEncode(data),
          options: Options(headers: headers),
        );
    }

    final int? statusCode = response.statusCode;
    final dynamic responseBody = response.data;

    Utils().printColored(
      "Response Code: $statusCode",
      color: PrintColor.yellow,
    );
    Utils().printColored("Response Body: ${jsonEncode(responseBody)}");

    return responseBody;
  }

  static Future<dynamic> _handleDioError(
    DioException dioError,
    String url,
    HttpMethod method,
    dynamic data,
    bool isRetry,
  ) async {
    final int? statusCode = dioError.response?.statusCode;
    final dynamic responseBody = dioError.response?.data;

    Utils().printColored("ERROR: $dioError", color: PrintColor.red);
    Utils().printColored(
      "Response Body: ${jsonEncode(responseBody)}",
      color: PrintColor.red,
    );

    if (statusCode == 401 && !isRetry) {
      // Token expired, attempt to refresh
      Utils().printColored(
        "Token expired, attempting to refresh...",
        color: PrintColor.yellow,
      );

      final bool refreshSuccess = await _refreshToken();
      if (refreshSuccess) {
        // Retry the original request with new token
        Utils().printColored(
          "Token refreshed successfully, retrying original request...",
        );
        return _request(url, method, data: data, isRetry: true);
      } else {
        // Refresh failed, redirect to login
        await _handleAuthFailure();
        return dioError.response?.data;
      }
    } else if (statusCode == 500) {
      await _handleAuthFailure();
      return dioError.response?.data;
    } else {
      return dioError.response?.data;
    }
  }

  /// Refreshes the access token using the refresh token
  static Future<bool> _refreshToken() async {
    return TokenRefreshService.refreshAccessToken();
  }

  /// Handles authentication failure by clearing data and redirecting to login
  static Future<void> _handleAuthFailure() async {
    await TokenRefreshService.handleAuthenticationFailure();
  }

  static Future<bool> checkInternetConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else {
      return false;
    }
  }
}

enum HttpMethod { get, put, post, postFormData, delete, putFormData, patch }

void printFormData(dynamic data) {
  if (data is FormData) {
    for (final field in data.fields) {
      Utils().printColored(
        "Field: ${field.key} = ${field.value}",
        color: PrintColor.brightYellow,
      );
    }
    for (final file in data.files) {
      Utils().printColored(
        "File: ${file.key} = ${file.value.filename}",
        color: PrintColor.bgYellow,
      );
    }
  } else if (data is Map<String, dynamic>) {
    Utils().printColored(
      "Request Body: ${jsonEncode(data)}",
      color: PrintColor.red,
    );
  }
}
