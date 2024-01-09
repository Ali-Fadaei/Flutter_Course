import 'package:flutter/foundation.dart';
import 'package:shop_app_optional_auth/data_providers/shop_api/shop_client.dart';
import 'package:shop_app_optional_auth/data_providers/shop_api/shop_url.dart';

abstract class ShopApi {
  //
  static final servers = ShopServers();

  static final urls = ShopUrls();

  static late final ShopHttpClient client;

  static void init({
    String? server,
    bool? logger,
    Function? onUnAuthorized,
  }) {
    client = ShopHttpClient(
      server: server ?? servers.current,
      logger: logger ?? kDebugMode,
      onUnAuthorized: onUnAuthorized ?? () {},
    );
  }
}
