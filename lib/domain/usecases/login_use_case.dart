// import "package:dio/dio.dart" as dio; // Dio for making HTTP requests
// import "package:sylo/app/core/usecases/no_param_usecase.dart";
// import "package:sylo/domain/entities/common_entity.dart";
// import "package:sylo/domain/entities/login_entity.dart";
// import "package:sylo/domain/entities/register_entity.dart";
// import "package:sylo/domain/repositories/auth_repository.dart";

// class AuthUseCase extends NoParamUseCase {
//   final AuthenticationRepository repo;
//   AuthUseCase(this.repo);

//   Future<LoginEntity> loginapi(Map<String, String> params) {
//     return repo.loginapi(params);
//   }

//   Future<CommonEntity> signUpapi(Map<String, String> params) {
//     return repo.signUpapi(params);
//   }

//   Future<RegisterEntity> verifyOtpapi(Map<String, String> params) {
//     return repo.verifyOtpapi(params);
//   }

//   Future<CommonEntity> resendOtpapi(Map<String, String> params) {
//     return repo.resendOtpapi(params);
//   }

//   Future<CommonEntity> forgotPasswordApi(Map<String, String> params) {
//     return repo.forgotPasswordApi(params);
//   }

//   Future<CommonEntity> verifyForgotPasswordOtpApi(Map<String, String> params) {
//     return repo.verifyForgotPasswordOtpApi(params);
//   }

//   Future<CommonEntity> resetPasswordApi(Map<String, String> params) {
//     return repo.resetPasswordApi(params);
//   }

//   /*---------------------------------Profile Setup ---------------------------------*/
//   Future<CommonEntity> privacyConsentApi(Map<String, bool> params) {
//     return repo.privacyConsentApi(params);
//   }

//   Future<CommonEntity> whatBringsToThisAppApi(
//     Map<String, List<String>> params,
//   ) {
//     return repo.whatBringsToThisAppApi(params);
//   }

//   Future<CommonEntity> setProfileDetailsApi(dio.FormData formData) {
//     return repo.setProfileDetailsApi(formData);
//   }

//   Future<CommonEntity> selectAppAccessApi(Map<String, String> params) {
//     return repo.selectAppAccessApi(params);
//   }

//   // Future<ProfileCompletionEntity> setProfileApi(dio.FormData formData) {
//   //   return repo.setProfileApi(formData);
//   // }

//   // Future<CommonEntity> verifyOtpAndResetPasswordApi(
//   //   Map<String, String> params,
//   // ) {
//   //   return repo.verifyOtpAndResetPasswordApi(params);
//   // }

//   @override
//   Future execute() {
//     throw UnimplementedError();
//   }
// }
