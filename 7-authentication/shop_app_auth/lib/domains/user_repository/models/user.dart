import 'package:equatable/equatable.dart';

class User extends Equatable {
  //
  final int id;

  final String firstName;

  final String lastName;

  final String mobileNumber;

  final String email;

  final String address;

  final String token;

  final bool isRegistered;

  final bool isActive;

  final bool isUsed;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.email,
    required this.address,
    required this.token,
    required this.isRegistered,
    required this.isActive,
    required this.isUsed,
  });

  factory User.fromMap(Map map) {
    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      mobileNumber: map['mobileNumber'],
      email: map['email'],
      address: map['address'],
      token: map['token'],
      isRegistered: map['isRegistered'],
      isActive: map['isActive'],
      isUsed: map['isUsed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'email': email,
      'address': address,
      'token': token,
      'isRegistered': isRegistered,
      'isActive': isActive,
      'isUsed': isUsed,
    };
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        mobileNumber,
        email,
        address,
        token,
        isRegistered,
        isActive,
        isUsed,
      ];
}
