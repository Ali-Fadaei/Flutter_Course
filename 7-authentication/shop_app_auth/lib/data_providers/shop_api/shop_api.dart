import 'package:flutter/foundation.dart';
import 'package:shop_app_auth/data_providers/shop_api/shop_client.dart';
import 'package:shop_app_auth/data_providers/shop_api/shop_urls.dart';

abstract class ShopApi {
  //
  static final servers = ShopServers();

  static final urls = ShopUrls();

  static late final ShopHttpClient client;

  static void init({
    String? server,
    bool? logger,
  }) {
    client = ShopHttpClient(
      server: server ?? servers.current,
      logger: logger ?? kDebugMode,
    );
  }
}
