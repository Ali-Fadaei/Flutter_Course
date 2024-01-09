class ShopResponse {
  //
  final bool result;

  final int status;

  final dynamic data;

  final ShopResponseMessage? message;

  ShopResponse({
    required this.result,
    required this.status,
    this.data,
    this.message,
  });

  factory ShopResponse.fromMap(Map<String, dynamic> map) {
    return ShopResponse(
      result: map['result'],
      status: map['status'],
      data: map['data'],
      message: ShopResponseMessage.fromMap(
        map['message'],
      ),
    );
  }
}

class ShopResponseMessage {
  //
  final String? general;

  final dynamic validations;

  ShopResponseMessage({
    this.general,
    this.validations,
  });

  factory ShopResponseMessage.fromMap(Map<String, dynamic>? map) {
    return ShopResponseMessage(
      general: map?['general'],
      validations: map?['validation'],
    );
  }
}
