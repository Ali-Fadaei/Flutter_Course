import 'package:shop_app_auth/data_providers/hive_db/hive_db.dart';

enum UserBoxKeys {
  accessToken,
}

abstract class UserBox {
  //
  static const name = 'user';

  static bool isOpen = false;

  static Future<void> open() async {
    if (!isOpen) {
      await HiveDB.openBox(boxName: name);
    }
  }

  static void setToken(String token) {
    HiveDB.setValue(
      box: name,
      key: UserBoxKeys.accessToken.index,
      value: token,
    );
  }

  static String getToken() {
    return HiveDB.getValue(
          box: name,
          key: UserBoxKeys.accessToken.index,
        ) ??
        '';
  }
}
