import "package:get_storage/get_storage.dart";
import "package:safeonvendor_flutter_repo/app/util/logger.dart";

class DataStorage {
  static final DataStorage _instance = DataStorage._internal();
  static DataStorage get instance => _instance;
  DataStorage._internal();
  static final storage = GetStorage();
  static const String isAdmin = "isAdmin";
  static const String accessKey = "accessKey";
  static const String refreshKey = "refreshKey";
  static const String userType = "userType";
  static const String userEmail = "userEmail";
  static const String currentLanguage = "currentLanguage";

  Future<void> putValue(String spKey, dynamic value) async {
    Log.printInfo("$spKey:$value");
    await storage.write(spKey, value);
  }

  dynamic getValue(String spKey) {
    return storage.read(spKey);
  }

  Future<void> removeValue(String spKey) {
    return storage.remove(spKey);
  }

  Future<void> erase() {
    return storage.erase();
  }
}
