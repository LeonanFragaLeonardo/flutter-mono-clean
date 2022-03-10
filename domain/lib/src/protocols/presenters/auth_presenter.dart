import 'package:domain/domain.dart';

abstract class AuthPresenter {
  Stream<User> listenUserChanges();
  void inputUsername(String? username);
  void inputPassword(String? password);
  Future<AuthenticationOutput> auth({
    required AuthenticationInput params,
    required AuthServiceEnum serviceToUse,
  });
}
