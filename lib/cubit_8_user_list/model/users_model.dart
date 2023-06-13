import 'package:flutter/foundation.dart' show immutable;

@immutable
class User {
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;

  const User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
  });

  User.fromJson(UserMap jsonData)
      : userId = jsonData["id"],
        firstName = jsonData["first_name"],
        lastName = jsonData["last_name"],
        email = jsonData["email"],
        gender = jsonData["gender"];

  @override
  String toString() => "FirstName: $firstName, Email:$email, Gender.$gender";
}

typedef UserMap = Map<String, dynamic>;
