class UserRegisterValidation {
  //
  final String? firstName;

  final String? lastName;

  final String? email;

  final String? address;

  const UserRegisterValidation({
    this.firstName,
    this.lastName,
    this.email,
    this.address,
  });

  factory UserRegisterValidation.fromMap(Map map) {
    return UserRegisterValidation(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      address: map['address'],
    );
  }
}
