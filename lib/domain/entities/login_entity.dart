class LoginEntity {
  bool? statusEntity;
  String? messageEntity;
  LoginDataEntity? dataEntity;

  LoginEntity({this.statusEntity, this.messageEntity, this.dataEntity});
}

class LoginDataEntity {
  String? accessTokenEntity;
  String? refreshTokenEntity;
  LoginUserDataEntity? userDataEntity;

  LoginDataEntity({
    this.accessTokenEntity,
    this.refreshTokenEntity,
    this.userDataEntity,
  });
}

class LoginUserDataEntity {
  String? idEntity;
  String? emailEntity;
  bool? isVerifiedEntity;
  String? deviceTypeEntity;
  bool? isSubscribedEntity;
  bool? isLoginEntity;
  bool? isActiveEntity;
  int? userTypeEntity;
  bool? isProfileCompletedEntity;
  bool? isBlockedEntity;
  DateTime? createdAtEntity;
  DateTime? updatedAtEntity;

  LoginUserDataEntity({
    this.idEntity,
    this.emailEntity,
    this.isVerifiedEntity,
    this.deviceTypeEntity,
    this.isSubscribedEntity,
    this.isLoginEntity,
    this.isActiveEntity,
    this.userTypeEntity,
    this.isProfileCompletedEntity,
    this.isBlockedEntity,
    this.createdAtEntity,
    this.updatedAtEntity,
  });
}
