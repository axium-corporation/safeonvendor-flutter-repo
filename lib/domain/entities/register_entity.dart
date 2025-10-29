class RegisterEntity {
  bool? statusEntity;
  String? messageEntity;
  RegisterDataEntity? dataEntity;

  RegisterEntity({this.statusEntity, this.messageEntity, this.dataEntity});
}

class RegisterDataEntity {
  String? accessTokenEntity;
  String? refreshTokenEntity;
  RegisterUserData? userDataEntity;

  RegisterDataEntity({
    this.accessTokenEntity,
    this.refreshTokenEntity,
    this.userDataEntity,
  });
}

class RegisterUserData {
  String? idEntity;
  String? emailEntity;
  String? deviceTypeEntity;
  bool? isVerifiedEntity;
  int? userTypeEntity;

  RegisterUserData({
    this.idEntity,
    this.emailEntity,
    this.deviceTypeEntity,
    this.isVerifiedEntity,
    this.userTypeEntity,
  });
}
