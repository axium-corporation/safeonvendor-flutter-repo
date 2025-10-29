// // To parse this JSON data, do
// //
// //     final loginModule = loginModuleFromJson(jsonString);

// import "dart:convert";

// import "package:sylo/domain/entities/login_entity.dart";

// LoginModule loginModuleFromJson(String str) =>
//     LoginModule.fromJson(json.decode(str));

// class LoginModule extends LoginEntity {
//   bool? status;
//   String? message;
//   Data? data;

//   LoginModule({this.status, this.message, this.data})
//     : super(statusEntity: status, messageEntity: message, dataEntity: data);

//   factory LoginModule.fromJson(Map<String, dynamic> json) => LoginModule(
//     status: json["status"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
// }

// class Data extends LoginDataEntity {
//   String? accessToken;
//   String? refreshToken;
//   UserData? userData;

//   Data({this.accessToken, this.refreshToken, this.userData})
//     : super(
//         accessTokenEntity: accessToken,
//         refreshTokenEntity: refreshToken,
//         userDataEntity: userData,
//       );

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     accessToken: json["accessToken"],
//     refreshToken: json["refreshToken"],
//     userData: json["userData"] == null
//         ? null
//         : UserData.fromJson(json["userData"]),
//   );
// }

// class UserData extends LoginUserDataEntity {
//   String? id;
//   String? email;
//   bool? isVerified;
//   String? deviceType;
//   bool? isSubscribed;
//   bool? isLogin;
//   bool? isActive;
//   int? userType;
//   bool? isProfileCompleted;
//   bool? isBlocked;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   UserData({
//     this.id,
//     this.email,
//     this.isVerified,
//     this.deviceType,
//     this.isSubscribed,
//     this.isLogin,
//     this.isActive,
//     this.userType,
//     this.isProfileCompleted,
//     this.isBlocked,
//     this.createdAt,
//     this.updatedAt,
//   }) : super(
//          idEntity: id,
//          emailEntity: email,
//          isVerifiedEntity: isVerified,
//          deviceTypeEntity: deviceType,
//          isSubscribedEntity: isSubscribed,
//          isLoginEntity: isLogin,
//          isActiveEntity: isActive,
//          userTypeEntity: userType,
//          isProfileCompletedEntity: isProfileCompleted,
//          isBlockedEntity: isBlocked,
//          createdAtEntity: createdAt,
//          updatedAtEntity: updatedAt,
//        );

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//     id: json["_id"],
//     email: json["email"],
//     isVerified: json["isVerified"],
//     deviceType: json["deviceType"],
//     isSubscribed: json["isSubscribed"],
//     isLogin: json["isLogin"],
//     isActive: json["isActive"],
//     userType: json["userType"],
//     isProfileCompleted: json["isProfileCompleted"],
//     isBlocked: json["isBlocked"],
//     createdAt: json["createdAt"] == null
//         ? null
//         : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null
//         ? null
//         : DateTime.parse(json["updatedAt"]),
//   );
// }
