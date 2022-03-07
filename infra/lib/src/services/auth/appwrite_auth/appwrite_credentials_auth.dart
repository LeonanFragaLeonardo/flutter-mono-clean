import 'package:appwrite/appwrite.dart';
import 'package:domain/domain.dart';

class AppWriteCredentialsAuth implements AuthenticateByPasswordService {
  final Client client;

  AppWriteCredentialsAuth({required this.client});

  @override
  Future<AuthenticationOutput> passwordAuthentication(
      {required String username, required String password}) async {
    final Account appWriteAccount = Account(client);
    try {
      final result = await appWriteAccount.createSession(
          email: username, password: password);
      final authToken = await appWriteAccount.createJWT();

      return AuthenticationOutput(
          authToken: authToken.data.toString(),
          idToken: result.data.toString());
    } on AppwriteException catch (ae) {
      print(ae.code);
      print(ae.message);
      print(ae.response);
      throw InvalidCredentialsException();
    }
  }
}
