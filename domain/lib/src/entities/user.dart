import 'dart:convert';

class User {
  final String username;
  final String password;
  final String email;
  final String uid;
  User({
    required this.username,
    required this.password,
    required this.email,
    required this.uid,
  });

  User copyWith({
    String? username,
    String? password,
    String? email,
    String? uid,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'uid': uid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(username: $username, password: $password, email: $email, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.username == username &&
        other.password == password &&
        other.email == email &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        email.hashCode ^
        uid.hashCode;
  }
}
