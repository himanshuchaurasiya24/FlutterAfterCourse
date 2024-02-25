// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Users {
  final int? userId;
  final String? fullName;
  final String? email;
  final String userName;
  final String password;
  Users({
    this.userId,
    this.fullName,
    this.email,
    required this.userName,
    required this.password,
  });

  Users copyWith({
    int? userId,
    String? fullName,
    String? email,
    String? userName,
    String? password,
  }) {
    return Users(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'userName': userName,
      'password': password,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      userId: map['userId'] != null ? map['userId'] as int : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      userName: map['userName'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) =>
      Users.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Users(userId: $userId, fullName: $fullName, email: $email, userName: $userName, password: $password)';
  }

  @override
  bool operator ==(covariant Users other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.fullName == fullName &&
        other.email == email &&
        other.userName == userName &&
        other.password == password;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        userName.hashCode ^
        password.hashCode;
  }
}
