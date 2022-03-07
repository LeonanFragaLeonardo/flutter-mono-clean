import 'package:domain/domain.dart';

abstract class AuthenticateByPasswordService {
  Future<AuthenticationOutput> passwordAuthentication(
      {required String username, required String password});
}
