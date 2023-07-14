import 'dart:convert';

class UserDataModel {
  final String email;
  final String firstName;
  final String lastName;
  final String image;
  final String token;

  UserDataModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.token,
  });

  UserDataModel copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? image,
    String? token,
  }) {
    return UserDataModel(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
      'token': token,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      image: map['image'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) => UserDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDataModel(email: $email, firstName: $firstName, lastName: $lastName, image: $image, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserDataModel &&
      other.email == email &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.image == image &&
      other.token == token;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      image.hashCode ^
      token.hashCode;
  }
}
