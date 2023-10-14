class UserRepository {
  //
  Future<void> requestOtp({required String mobileNumber}) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> confirmOtp({
    required String hashId,
    required String pinCode,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> register({
    required String hashId,
    required String pinCode,
    required String name,
    required String lastName,
    required String address,
    required String email,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
