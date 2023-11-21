class UserRegisterValidation {
  //
  final String? firstName;

  final String? lastName;

  final String? email;

  final String? address;

  const UserRegisterValidation({
    this.firstName,
    this.lastName,
    this.address,
    this.email,
  });

  factory UserRegisterValidation.fromMap(Map map) {
    return UserRegisterValidation(
      firstName: map['firstName'],
      lastName: map['lastName'],
      address: map['address'],
      email: map['map'],
    );
  }
}
