class CommonEntity {
  bool? statusEntity;
  String? messageEntity;
  CommonDataEntity? dataEntity;

  CommonEntity({this.statusEntity, this.messageEntity, this.dataEntity});
}

class CommonDataEntity {
  int? otpEntity;

  CommonDataEntity({this.otpEntity});
}
