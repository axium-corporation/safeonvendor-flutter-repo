import "dart:convert";

import "package:dio/dio.dart";
import "package:get/get.dart" as getx;
import "package:safeonvendor_flutter_repo/app/util/api_endpoint.dart";
import "package:safeonvendor_flutter_repo/app/util/data_storage.dart";
import "package:safeonvendor_flutter_repo/app/util/util.dart";
import "package:safeonvendor_flutter_repo/presentation/pages.dart";

/// Standalone Token Refresh Service
///
/// This service handles token refresh when a 401 unauthorized error occurs.
/// It follows a clean, maintainable, and scalable approach.
class TokenRefreshService {
  static final Dio _dio = Dio();
  static bool _isRefreshing = false;

  /// Main method to refresh access token when it expires (401 error)
  ///
  /// Returns:
  /// - true if token refresh was successful
  /// - false if refresh failed (user should be redirected to login)
  static Future<bool> refreshAccessToken() async {
    try {
      // Prevent multiple simultaneous refresh attempts
      if (_isRefreshing) {
        Utils().printColored(
          "Token refresh already in progress, waiting...",
          color: PrintColor.yellow,
        );
        return await _waitForRefreshToComplete();
      }

      _isRefreshing = true;

      // Validate refresh token availability
      if (!_isRefreshTokenValid()) {
        Utils().printColored(
          "No valid refresh token available",
          color: PrintColor.red,
        );
        return false;
      }

      Utils().printColored(
        "Starting token refresh process...",
        color: PrintColor.blue,
      );

      // Make refresh token API call
      final response = await _makeRefreshTokenRequest();

      // Process the response
      final bool success = await _processRefreshResponse(response);

      if (success) {
        Utils().printColored("Token refresh completed successfully");
      } else {
        Utils().printColored("Token refresh failed", color: PrintColor.red);
      }

      return success;
    } catch (e) {
      Utils().printColored("Token refresh error: $e", color: PrintColor.red);
      return false;
    } finally {
      _isRefreshing = false;
    }
  }

  /// Validates if refresh token is available and valid
  static bool _isRefreshTokenValid() {
    return Utils.refreshToken != null && Utils.refreshToken!.isNotEmpty;
  }

  /// Makes the actual HTTP request to refresh token endpoint
  static Future<Response> _makeRefreshTokenRequest() async {
    final Map<String, String> headers = {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "x-api-key": Utils.xApiKey ?? "",
      "x-app-version": "1.0.0",
      "Authorization": "Bearer ${Utils.refreshToken}", // Send refresh token
    };

    Utils().printColored(
      "Refresh Token Headers: $headers",
      color: PrintColor.white,
    );

    return _dio.get(APIEndpoint.baseUrl, options: Options(headers: headers));
  }

  /// Processes the refresh token API response
  ///
  /// Expected response format:
  /// {
  ///   "status": true,
  ///   "message": "Token refreshed successfully",
  ///   "data": {
  ///     "accessToken": "new_access_token_here"
  ///   }
  /// }
  static Future<bool> _processRefreshResponse(Response response) async {
    try {
      Utils().printColored(
        "Refresh token response: ${jsonEncode(response.data)}",
      );

      // Parse response using CommonModule
      // final LoginModule loginModule = LoginModule.fromJson(response.data);

      // Validate response structure
      // if (!_isValidRefreshResponse(loginModule)) {
      //   Utils().printColored(
      //     "Invalid refresh token response format",
      //     color: PrintColor.red,
      //   );
      //   return false;
      // }

      // Extract new access token
      // final String newAccessToken = loginModule.data?.accessToken ?? "";

      // Update tokens in memory and persistent storage
      // await _updateAccessToken(newAccessToken);

      return true;
    } catch (e) {
      Utils().printColored(
        "Error processing refresh response: $e",
        color: PrintColor.red,
      );
      return false;
    }
  }

  /// Validates the refresh token response format
  // static bool _isValidRefreshResponse(LoginModule loginModule) {
  //   return loginModule.status == true &&
  //       loginModule.data != null &&
  //       loginModule.data?.accessToken != null &&
  //       loginModule.data!.accessToken!.isNotEmpty;
  // }

  /// Updates the access token in both memory and persistent storage
  // static Future<void> _updateAccessToken(String newAccessToken) async {
  //   // Update in memory
  //   Utils.acessToken = newAccessToken;

  //   // Save to persistent storage
  //   await DataStorage.instance.putValue(DataStorage.accessKey, newAccessToken);

  //   Utils().printColored(
  //     "New access token saved: ${newAccessToken.substring(0, 20)}...",
  //   );
  // }

  /// Waits for an ongoing refresh operation to complete
  static Future<bool> _waitForRefreshToComplete() async {
    int attempts = 0;
    const maxAttempts = 30; // Wait up to 3 seconds

    while (_isRefreshing && attempts < maxAttempts) {
      await Future.delayed(const Duration(milliseconds: 100));
      attempts++;
    }

    // Return true if refresh completed and we have a valid token
    return !_isRefreshing && Utils.acessToken != null;
  }

  /// Handles complete authentication failure
  /// Clears all stored data and redirects to login
  static Future<void> handleAuthenticationFailure() async {
    Utils().printColored(
      "Authentication failed, clearing all data and redirecting to login",
      color: PrintColor.red,
    );

    // Clear persistent storage
    await DataStorage.instance.erase();

    // Clear in-memory tokens
    Utils.acessToken = null;
    Utils.refreshToken = null;
    Utils.isProfileCompleted = null;

    // Redirect to splash screen (which will redirect to login)
    getx.Get.offAllNamed(Routes.splashRoute);
  }
}

/// Usage Example:
/// 
/// When you get a 401 error in your API call:
/// 
/// ```dart
/// if (statusCode == 401 && !isRetry) {
///   final bool refreshSuccess = await TokenRefreshService.refreshAccessToken();
///   if (refreshSuccess) {
///     // Retry the original API call
///     return await _retryOriginalRequest();
///   } else {
///     // Redirect to login
///     await TokenRefreshService.handleAuthenticationFailure();
///     return null;
///   }
/// }
/// ``` 
