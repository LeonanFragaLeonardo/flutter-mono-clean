import 'dart:convert';

class AuthenticationInput {
  final String username;
  final String password;
  AuthenticationInput({
    required this.username,
    required this.password,
  });

  AuthenticationInput copyWith({
    String? username,
    String? password,
  }) {
    return AuthenticationInput(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory AuthenticationInput.fromMap(Map<String, dynamic> map) {
    return AuthenticationInput(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationInput.fromJson(String source) =>
      AuthenticationInput.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthenticationInput(username: $username, password: $password)';
}
