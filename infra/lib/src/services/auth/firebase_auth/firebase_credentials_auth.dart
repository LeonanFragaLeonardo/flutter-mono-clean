import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCredentialsAuth implements AuthenticateByPasswordService {
  @override
  Future<AuthenticationOutput> passwordAuthentication(
      {required String username, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      if (userCredential.user == null) {
        throw InvalidCredentialsException();
      }
      final idToken = await userCredential.user!.getIdToken();
      return AuthenticationOutput(
          authToken: userCredential.user!.uid, idToken: idToken);
    } on FirebaseAuthException catch (e) {
      print(e);
      throw InvalidCredentialsException();
    }
  }
}
