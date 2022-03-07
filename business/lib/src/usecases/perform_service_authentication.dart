import 'package:domain/domain.dart';

class PerformServiceAuthentication implements PerformAuthentication {
  final AuthenticateByPasswordService authenticateByPasswordService;

  PerformServiceAuthentication({required this.authenticateByPasswordService});
  @override
  Future<AuthenticationOutput> call({required AuthenticationInput user}) {
    return authenticateByPasswordService.passwordAuthentication(
        username: user.username, password: user.password);
  }
}
