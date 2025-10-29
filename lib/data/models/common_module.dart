// // To parse this JSON data, do
// //
// //     final commonModule = commonModuleFromJson(jsonString);

// import "dart:convert";

// import "package:sylo/domain/entities/common_entity.dart";

// CommonModule commonModuleFromJson(String str) =>
//     CommonModule.fromJson(json.decode(str));

// class CommonModule extends CommonEntity {
//   bool? status;
//   String? message;
//   Data? data;

//   CommonModule({this.status, this.message, this.data})
//     : super(statusEntity: status, messageEntity: message, dataEntity: data);

//   factory CommonModule.fromJson(Map<String, dynamic> json) => CommonModule(
//     status: json["status"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
// }

// class Data extends CommonDataEntity {
//   int? otp;

//   Data({this.otp}) : super(otpEntity: otp);

//   factory Data.fromJson(Map<String, dynamic> json) => Data(otp: json["otp"]);
// }
