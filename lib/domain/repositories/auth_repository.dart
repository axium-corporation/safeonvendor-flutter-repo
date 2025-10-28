// import "package:dio/dio.dart" as dio; // Dio for making HTTP requests
// import "package:sylo/domain/entities/common_entity.dart";
// import "package:sylo/domain/entities/login_entity.dart";
// import "package:sylo/domain/entities/register_entity.dart";

// abstract class AuthenticationRepository {
//   Future<LoginEntity> loginapi(Map<String, String> appAuth);
//   Future<CommonEntity> signUpapi(Map<String, String> appAuth);
//   Future<RegisterEntity> verifyOtpapi(Map<String, String> appAuth);
//   Future<CommonEntity> resendOtpapi(Map<String, String> appAuth);
//   Future<CommonEntity> forgotPasswordApi(Map<String, String> appAuth);
//   Future<CommonEntity> verifyForgotPasswordOtpApi(Map<String, String> appAuth);
//   Future<CommonEntity> resetPasswordApi(Map<String, String> appAuth);
//   /*---------------------------------Profile Setup ---------------------------------*/
//   Future<CommonEntity> privacyConsentApi(Map<String, bool> appAuth);
//   Future<CommonEntity> whatBringsToThisAppApi(Map<String, List<String>> params);
//   Future<CommonEntity> setProfileDetailsApi(dio.FormData formData);
//   Future<CommonEntity> selectAppAccessApi(Map<String, String> params);
// }
