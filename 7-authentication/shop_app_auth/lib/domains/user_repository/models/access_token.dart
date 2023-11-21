class AccessToken {
  //
  final String token;

  final DateTime ttl;

  final DateTime ttr;

  AccessToken({
    required this.token,
    required this.ttl,
    required this.ttr,
  });

  AccessToken.create({
    required this.token,
  })  : ttl = DateTime.now().add(const Duration(days: 7)),
        ttr = DateTime.now().add(const Duration(days: 5));

  factory AccessToken.fromMap(Map<dynamic, dynamic> map) {
    return AccessToken(
      token: map['token'],
      ttl: DateTime.parse(map['ttl']),
      ttr: DateTime.parse(map['ttr']),
    );
  }

  toMap() {
    return {
      'token': token,
      'ttl': ttl.toString(),
      'ttr': ttr.toString(),
    };
  }

  bool canUse() {
    return !ttl.difference(DateTime.now()).isNegative;
  }

  bool shouldRefresh() {
    return ttr.difference(DateTime.now()).isNegative;
  }
}
