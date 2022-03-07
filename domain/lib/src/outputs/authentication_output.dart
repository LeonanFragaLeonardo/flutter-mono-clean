import 'dart:convert';

class AuthenticationOutput {
  final String authToken;
  final String idToken;
  AuthenticationOutput({
    required this.authToken,
    required this.idToken,
  });

  AuthenticationOutput copyWith({
    String? authToken,
    String? idToken,
  }) {
    return AuthenticationOutput(
      authToken: authToken ?? this.authToken,
      idToken: idToken ?? this.idToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authToken': authToken,
      'idToken': idToken,
    };
  }

  factory AuthenticationOutput.fromMap(Map<String, dynamic> map) {
    return AuthenticationOutput(
      authToken: map['authToken'] ?? '',
      idToken: map['idToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationOutput.fromJson(String source) =>
      AuthenticationOutput.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthenticationOutput(authToken: $authToken, idToken: $idToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthenticationOutput &&
        other.authToken == authToken &&
        other.idToken == idToken;
  }

  @override
  int get hashCode => authToken.hashCode ^ idToken.hashCode;
}
