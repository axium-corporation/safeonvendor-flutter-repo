class APIEndpoint {
  //hange here
  static String baseUrl = "";
  /*---------------------------------Auth Endpoints---------------------------------*/
  static String get loginUrl => "$baseUrl/auth/login";
  static String get signUpUrl => "$baseUrl/auth/signup";
  static String get verifyOtpUrl => "$baseUrl/auth/verify-otp";
  static String get resendOtpUrl => "$baseUrl/auth/resend-otp";
  static String get forgotPasswordUrl => "$baseUrl/auth/forgot-password";
  static String get verifyForgotPasswordUrl =>
      "$baseUrl/auth/verify-password-otp";
  static String get resetPasswordUrl => "$baseUrl/auth/set-new-password";
  /*---------------------------------Profile Setup Endpoints---------------------------------*/
  static String get privacyConsentUrl => "$baseUrl/onboarding/privacy-consent";
  static String get whatBringsToThisAppUrl => "$baseUrl/onboarding/intent";
  static String get setProfileDetailsUrl => "$baseUrl/onboarding/profile-setup";
  static String get setProfileImageUrl => "$baseUrl/onboarding/upload-avatar";
  static String get selectAppAccessUrl => "$baseUrl/onboarding/app-access";
  /*---------------------------------Auth Endpoints---------------------------------*/

  /*---------------------------------Care Profile Endpoints---------------------------------*/
  static String get logOutUrl => "$baseUrl/profile/logout";
  static String get getProfileUrl => "$baseUrl/profile";
  static String get editProfileUrl => "$baseUrl/profile";
  /*---------------------------------Service Endpoints---------------------------------*/
  static String get createCustomServiceLink => "$baseUrl/service-links";
  static String get getServicesUrl => "$baseUrl/service-links";
  static String get deleteServiceUrl => "$baseUrl/service-links/";
  static String get updateServiceUrl => "$baseUrl/service-links/";

  //boking
  //   static String get bookingtype => "$baseUrl/user/booking/types";
  //   static String get booking => "$baseUrl/user/booking";
  //   static String get forgetBooking => "$baseUrl/user/request/booking";

  //   static String get schedulesOverView => "$baseUrl/user/schedules";
  //   // ?startDate=2022-07-01&days=7

  //   static String get bookingsOverView => "$baseUrl/user/bookings";
  //   //request absences
  //   static String get absenceType => "$baseUrl/user/absence-types";
  //   static String get requestAbsence => "$baseUrl/user/request/absence";
  //   // ?startDate=2022-07-01&days=7
  //   static String get absencesOverView => "$baseUrl/user/absences";

  //   static String get anomaliesOverView => "$baseUrl/user/anomalies";

  // //user
  //   static String get fecthusers => "$baseUrl/user/info";
  //   static String get fecthdata => "$baseUrl/user/data";
  // //company
  //   static String get companyDeatil => "$baseUrl/user/company/data";
}
