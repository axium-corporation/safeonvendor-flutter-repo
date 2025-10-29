// import "dart:convert";

// import "package:dio/dio.dart" as dio; // Dio for making HTTP requests
// import "package:fluttertoast/fluttertoast.dart";
// import "package:get/get.dart";
// import "package:logger/logger.dart";
// import "package:sylo/app/util/api_endpoint.dart";
// import "package:sylo/data/models/common_module.dart";
// import "package:sylo/data/models/login_module.dart";
// import "package:sylo/data/models/register_module.dart";
// import "package:sylo/data/providers/network/api_provider.dart";
// import "package:sylo/domain/repositories/auth_repository.dart";

// class AuthenticationRepositoryIml extends AuthenticationRepository {
//   @override
//   Future<LoginModule> loginapi(Map<String, String> appAuth) async {
//     try {
//       final response = await ApiHelper.post(APIEndpoint.loginUrl, appAuth);

//       return loginModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "LoginFailed".tr);
//       Logger().e("Error fetching Login: $e");
//       rethrow;
//     }
//   }

//   @override
//   Future<CommonModule> signUpapi(Map<String, String> appAuth) async {
//     try {
//       final response = await ApiHelper.post(APIEndpoint.signUpUrl, appAuth);

//       return commonModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "SignUpFailed".tr);
//       Logger().e("Error fetching SignUp: $e");
//       rethrow;
//     }
//   }

//   @override
//   Future<RegisterModule> verifyOtpapi(Map<String, String> appAuth) async {
//     try {
//       final response = await ApiHelper.post(APIEndpoint.verifyOtpUrl, appAuth);

//       return registerModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "LoginFailed".tr);
//       Logger().e("Error fetching Verify OTP: $e");
//       rethrow;
//     }
//   }

//   @override
//   Future<CommonModule> resendOtpapi(Map<String, String> appAuth) async {
//     try {
//       final response = await ApiHelper.post(APIEndpoint.resendOtpUrl, appAuth);

//       return commonModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "SignUpFailed".tr);
//       Logger().e("Error fetching SignUp: $e");
//       rethrow;
//     }
//   }

//   @override
//   Future<CommonModule> forgotPasswordApi(Map<String, String> appAuth) async {
//     try {
//       final response = await ApiHelper.post(
//         APIEndpoint.forgotPasswordUrl,
//         appAuth,
//       );

//       return commonModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "SignUpFailed".tr);
//       Logger().e("Error fetching SignUp: $e");
//       rethrow;
//     }
//   }

//   @override
//   Future<CommonModule> verifyForgotPasswordOtpApi(
//     Map<String, String> appAuth,
//   ) async {
//     try {
//       final response = await ApiHelper.post(
//         APIEndpoint.verifyForgotPasswordUrl,
//         appAuth,
//       );

//       return commonModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "SignUpFailed".tr);
//       Logger().e("Error fetching SignUp: $e");
//       rethrow;
//     }
//   }

//   @override
//   Future<CommonModule> resetPasswordApi(Map<String, String> appAuth) async {
//     try {
//       final response = await ApiHelper.post(
//         APIEndpoint.resetPasswordUrl,
//         appAuth,
//       );

//       return commonModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "SignUpFailed".tr);
//       Logger().e("Error fetching SignUp: $e");
//       rethrow;
//     }
//   }
//   /*---------------------------------Profile Setup ---------------------------------*/

//   @override
//   Future<CommonModule> privacyConsentApi(Map<String, bool> params) async {
//     try {
//       final response = await ApiHelper.patch(
//         APIEndpoint.privacyConsentUrl,
//         data: params,
//       );

//       return commonModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "SignUpFailed".tr);
//       Logger().e("Error fetching SignUp: $e");
//       rethrow;
//     }
//   }

//   @override
//   Future<CommonModule> whatBringsToThisAppApi(
//     Map<String, List<String>> params,
//   ) async {
//     try {
//       final response = await ApiHelper.patch(
//         APIEndpoint.whatBringsToThisAppUrl,
//         data: params,
//       );

//       return commonModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "SignUpFailed".tr);
//       Logger().e("Error fetching SignUp: $e");
//       rethrow;
//     }
//   }

//   @override
//   Future<CommonModule> setProfileDetailsApi(dio.FormData formData) async {
//     try {
//       final response = await ApiHelper.patch(
//         APIEndpoint.setProfileDetailsUrl,
//         data: formData,
//       );

//       return commonModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "SignUpFailed".tr);
//       Logger().e("Error fetching SignUp: $e");
//       rethrow;
//     }
//   }

//   @override
//   Future<CommonModule> selectAppAccessApi(Map<String, String> params) async {
//     try {
//       final response = await ApiHelper.patch(
//         APIEndpoint.selectAppAccessUrl,
//         data: params,
//       );

//       return commonModuleFromJson(jsonEncode(response));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "SignUpFailed".tr);
//       Logger().e("Error fetching SignUp: $e");
//       rethrow;
//     }
//   }
// }
