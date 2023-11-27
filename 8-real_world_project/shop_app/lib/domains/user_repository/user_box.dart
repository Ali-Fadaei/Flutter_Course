import 'package:shop_app/data_providers/hive_db/hive_db.dart';
import 'package:shop_app/domains/user_repository/models/access_token.dart';
import 'package:shop_app/domains/user_repository/models/user.dart';

enum UserBoxKeys {
  accessToken,
  user,
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

  static void setUser(User? user) {
    HiveDB.setValue(
      box: name,
      key: UserBoxKeys.user.index,
      value: user?.toMap(),
    );
  }

  static User? getUser() {
    final res = HiveDB.getValue(
      box: name,
      key: UserBoxKeys.user.index,
    );
    return res != null ? User.fromMap(res) : null;
  }
}
