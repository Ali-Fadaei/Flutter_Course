import 'package:shop_app_auth/data_providers/hive_db/hive_db.dart';
import 'package:shop_app_auth/domains/user_repository/models/access_token.dart';

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

  static void setToken(AccessToken? token) {
    HiveDB.setValue(
      box: name,
      key: UserBoxKeys.accessToken.index,
      value: token?.toMap(),
    );
  }

  static AccessToken? getToken() {
    final res = HiveDB.getValue(
      box: name,
      key: UserBoxKeys.accessToken.index,
    );
    return res != null ? AccessToken.fromMap(res) : null;
  }
}
