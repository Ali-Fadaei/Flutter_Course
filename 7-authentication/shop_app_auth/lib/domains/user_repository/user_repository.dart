import 'dart:async';

import 'package:shop_app_auth/data_providers/shop_api/shop_api.dart';
import 'package:shop_app_auth/domains/user_repository/models/user.dart';
import 'package:shop_app_auth/domains/user_repository/user_box.dart';

class UserRepository {
  //
  static Future<UserRepository> init() async {
    await UserBox.open();
    return UserRepository();
  }

  final _jwtAuthCtrl = StreamController<bool>.broadcast();

  Stream<bool> get jwtAuthStream => _jwtAuthCtrl.stream;

  bool checkJwtAuth() {
    return UserBox.getToken().isNotEmpty;
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
      UserBox.setToken(user.token);
      _jwtAuthCtrl.add(true);
    }
    return user.isRegistered;
  }

  Future<void> userRegister({
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

    final user = User.fromMap(res.data);
    UserBox.setToken(user.token);
    _jwtAuthCtrl.add(true);
  }

  Future<void> logOut() async {
    UserBox.setToken('');
    _jwtAuthCtrl.add(false);
  }
}
