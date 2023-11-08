import 'package:shop_app_auth/data_providers/shop_api/shop_api.dart';
import 'package:shop_app_auth/domains/user_repository/models/user.dart';

class UserRepository {
  //
  Future<UserRepository> init() async {
    return UserRepository();
  }

  Future<({String id, int expTime})> otpGenerate(String mobileNumber) async {
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

  Future<User> otpConfirm({
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
    return User.fromMap(res.data);
  }

  // Future<User> userRegister({
  //   required String id,
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   required String address,
  // }) async {
  //   final res = await ShopApi.client.put(
  //     ShopApi.urls.otpRegister,
  //   );
  // }
}
