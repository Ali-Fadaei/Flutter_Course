class RegisterPV {
  //
  final String? id;

  final String? firstName;

  final String? lastName;

  final String? email;

  final String? address;

  final String? isUsed;

  RegisterPV({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.isUsed,
  });

  factory RegisterPV.fromMap(Map<String, dynamic> map) {
    return RegisterPV(
        id: map['id'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        email: map['email'],
        address: map['address'],
        isUsed: map['isUsed']);
  }
}
