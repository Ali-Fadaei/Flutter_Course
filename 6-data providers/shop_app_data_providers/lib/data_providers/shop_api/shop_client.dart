import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_app_data_providers/data_providers/shop_api/shop_response.dart';

class ShopHttpClient {
  //
  final _dio = Dio();

  ShopHttpClient({
    required String server,
    required bool logger,
  }) {
    _dio.options.baseUrl = server;
    _dio.options.connectTimeout = const Duration(minutes: 1);
    _dio.options.sendTimeout = const Duration(minutes: 1);
    _dio.options.receiveTimeout = const Duration(minutes: 1);
    if (logger) addLogger();
    addResponseInterceptor();
  }

  void addResponseInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          response.data = ShopResponse.fromMap(response.data);
          handler.next(response);
        },
      ),
    );
  }

  void addLogger() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  Map<String, dynamic>? nullKiller(Map<String, dynamic>? map) {
    Map<String, dynamic>? temp = {};
    map?.forEach(
      (key, value) {
        if (value != null) {
          if (value == '') {
            temp[key] = null;
          } else if (value.runtimeType == Map) {
            temp[key] = nullKiller(value);
          } else {
            temp[key] = value;
          }
        }
      },
    );
    return temp;
  }

  Map<String, dynamic>? qpNullKiller(Map<String, dynamic>? map) {
    Map<String, dynamic>? temp = {};
    map?.forEach(
      (key, value) {
        if (value != null && value != '') {
          if (value.runtimeType == Map) {
            temp[key] = qpNullKiller(value);
          } else {
            temp[key] = value;
          }
        }
      },
    );
    return temp;
  }

  Options _buildReqOptions({String? accessToken}) {
    return Options(
      headers: {
        "Accept-language": "fa",
        "Accept": "application/json",
        "content": "application/json",
        if (accessToken != null) "Authorization": accessToken,
      },
    );
  }

  Future<ShopResponse> get(
    String url, {
    String? param,
    String? accessToken,
    Map<String, dynamic>? queryParams,
  }) async {
    final res = await _dio.get(
      param == null ? url : '$url/$param',
      queryParameters: qpNullKiller(queryParams),
      options: _buildReqOptions(
        accessToken: accessToken,
      ),
    );
    return res.data;
  }

  Future post(
    String url, {
    String? accessToken,
    Map<String, dynamic>? data,
  }) async {
    final res = await _dio.post(
      url,
      data: nullKiller(data),
      options: _buildReqOptions(
        accessToken: accessToken,
      ),
    );
    return res;
  }

  Future put(
    String url, {
    required String param,
    String? accessToken,
    Map<String, dynamic>? data,
  }) async {
    final res = await _dio.put(
      '$url/$param',
      data: nullKiller(data),
      options: _buildReqOptions(
        accessToken: accessToken,
      ),
    );
    return res;
  }

  Future delete(
    String url,
    String? accessToken,
    List<int> ids,
  ) async {
    final res = await _dio.delete(
      url,
      data: {
        "ids": ids,
      },
      options: _buildReqOptions(
        accessToken: accessToken,
      ),
    );
    return res;
  }
}
