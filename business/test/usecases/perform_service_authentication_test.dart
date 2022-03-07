import 'package:business/src/usecases/perform_service_authentication.dart';
import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class AuthenticateByPasswordServiceMock extends Mock
    implements AuthenticateByPasswordService {}

void main() {
  late final PerformServiceAuthentication sut;
  late final AuthenticateByPasswordService authenticateByPasswordService;

  setUpAll(() {
    authenticateByPasswordService = AuthenticateByPasswordServiceMock();
    sut = PerformServiceAuthentication(
        authenticateByPasswordService: authenticateByPasswordService);
  });
  group('Authentication', () {
    test('Perform authentication by using service', () async {
      when(() =>
          authenticateByPasswordService.passwordAuthentication(
              username: any(named: 'username'),
              password: any(named: 'password'))).thenAnswer((_) async =>
          AuthenticationOutput(authToken: 'auth_token', idToken: 'id_token'));
      final authResult = await sut.call(
          user: AuthenticationInput(
              password: 'any_password', username: 'any_user'));
      expect(authResult, isNotNull);
      expect(authResult.authToken, 'auth_token');
      expect(authResult.idToken, 'id_token');
    });
  });
}
