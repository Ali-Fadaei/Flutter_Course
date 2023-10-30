class ShopResponse {
  //
  final bool result;

  final int status;

  final dynamic data;

  final ShopResponseMessage? message;

  const ShopResponse({
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
      message: map['message'],
    );
  }
}

class ShopResponseMessage {
  //
  final String? general;

  final Map<String, String>? validations;

  ShopResponseMessage({
    this.general,
    this.validations,
  });
}
