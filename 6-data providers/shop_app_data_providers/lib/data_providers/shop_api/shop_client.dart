import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_app_data_providers/data_providers/shop_api/shop_response.dart';

class ShopHttpClient {
  //
  final _dio = Dio();

  ShopHttpClient({
    required String server,
    bool logger = false,
  }) {
    _dio.options.baseUrl = server;
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.sendTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    if (logger) addLogger();
    addBaseResponseInterceptor();
  }

  void addLogger() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }

  void addBaseResponseInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          response.data = ShopResponse.fromMap(response.data);
          handler.next(response);
        },
      ),
    );
  }

  Options _buildReqOptions({String? accessToken}) {
    return Options(
      headers: {
        'Accept-Language': 'fa',
        'Accept': 'application/json',
        'Content-type': 'application/json',
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
    if (param != null) url = '$url/$param';
    final res = await _dio.get(
      url,
      queryParameters: queryParams,
      options: _buildReqOptions(
        accessToken: accessToken,
      ),
    );
    return res.data;
  }

  Future<ShopResponse> post(
    String url, {
    String? accessToken,
    Map<String, dynamic>? data,
  }) async {
    final res = await _dio.post(
      url,
      data: data,
      options: _buildReqOptions(
        accessToken: accessToken,
      ),
    );
    return res.data;
  }

  Future<ShopResponse> put(
    String url, {
    required String param,
    String? accessToken,
    Map<String, dynamic>? data,
  }) async {
    final res = await _dio.put(
      '$url/$param',
      data: data,
      options: _buildReqOptions(
        accessToken: accessToken,
      ),
    );
    return res.data;
  }

  Future<ShopResponse> delete(
    String url, {
    String? accessToken,
    required List<int> ids,
  }) async {
    final res = await _dio.put(
      url,
      data: {"ids": ids},
      options: _buildReqOptions(
        accessToken: accessToken,
      ),
    );
    return res.data;
  }
}
