import 'dart:async';

import 'package:shop_app/data_providers/shop_api/shop_api.dart';
import 'package:shop_app/domains/user_repository/models/access_token.dart';
import 'package:shop_app/domains/user_repository/models/register.dart';
import 'package:shop_app/domains/user_repository/models/user.dart';
import 'package:shop_app/domains/user_repository/user_box.dart';

class UserRepository {
  //
  static Future<UserRepository> init() async {
    await UserBox.open();
    return UserRepository();
  }

  final _jwtAuthCtrl = StreamController<bool>.broadcast();

  Stream<bool> get jwtAuthStream => _jwtAuthCtrl.stream;

  bool checkJwtAuth() {
    return UserBox.getToken()?.canUse() ?? false;
  }

  Future<User?> readProfile() async {
    final accessToken = UserBox.getToken();
    if (accessToken?.canUse() ?? false) {
      await refresh();
    } else {
      logOut();
      throw Exception('Access Token Expired');
    }
    return UserBox.getUser();
  }

  User? readProfileSync() {
    return UserBox.getUser();
  }

  Future<String> getAccessToken() async {
    final aceessToken = UserBox.getToken();
    if (aceessToken?.canUse() ?? false) {
      if (aceessToken?.shouldRefresh() ?? false) {
        await refresh();
        return await getAccessToken();
      } else {
        return aceessToken!.token;
      }
    } else {
      logOut();
      throw Exception('Access Token Expired');
    }
  }

  Future<({String id, int expTime})> otpGenerate(
    String mobileNumber,
  ) async {
    //
    final res = await ShopApi.client.post(
      ShopApi.urls.otpGenerate,
      data: {
        'mobileNumber': mobileNumber,
      },
    );
    return (
      id: res.data['id'] as String,
      expTime: res.data['expireTime'] as int
    );
  }

  Future<bool> otpConfirm({
    required String id,
    required String code,
  }) async {
    final res = await ShopApi.client.post(
      ShopApi.urls.otpConfirm,
      data: {
        'id': id,
        'code': code,
      },
    );
    final user = User.fromMap(res.data);
    if (user.isRegistered) {
      UserBox.setUser(user);
      UserBox.setToken(AccessToken.create(token: user.token));
      _jwtAuthCtrl.add(true);
    }
    return user.isRegistered;
  }

  Future<
      ({
        bool result,
        RegisterPV? validation,
      })> userRegister({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String address,
  }) async {
    final res = await ShopApi.client.put(ShopApi.urls.otpRegister, data: {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
    });
    if (res.result) {
      final user = User.fromMap(res.data);
      UserBox.setUser(user);

      UserBox.setToken(AccessToken.create(token: user.token));
      _jwtAuthCtrl.add(true);
      return (result: true, validation: null);
    } else {
      final validation = RegisterPV.fromMap(res.message?.validations);
      return (result: false, validation: validation);
    }
  }

  Future<void> refresh() async {
    final res = await ShopApi.client.post(
      ShopApi.urls.refresh,
      accessToken: UserBox.getToken()?.token,
    );
    final user = User.fromMap(res.data);
    UserBox.setUser(user);
    UserBox.setToken(AccessToken.create(token: user.token));
    _jwtAuthCtrl.add(true);
  }

  Future<void> logOut() async {
    final accessToken = UserBox.getToken();
    if (accessToken?.canUse() ?? false) {
      await ShopApi.client.post(
        ShopApi.urls.logout,
        accessToken: accessToken?.token,
      );
    }
    UserBox.setUser(null);
    UserBox.setToken(null);
    _jwtAuthCtrl.add(false);
  }
}
