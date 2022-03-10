import 'package:app/main/di/auth/appwrite_client_config.dart';
import 'package:domain/domain.dart';
import 'package:infra/infra.dart';
import 'package:presentation/auth/getx_authentication_presenter.dart';
import 'package:business/business.dart';

AuthPresenter makeGetXAuthPresenter() {
  final firebaseAuthService = FirebaseCredentialsAuth();
  final appWriteAuthService =
      AppWriteCredentialsAuth(client: makeAppWriteClientConfig());
  final authUsecaseWithFirebase = PerformServiceAuthentication(
      authenticateByPasswordService: firebaseAuthService);
  final authUsecaseWithAppwrite = PerformServiceAuthentication(
      authenticateByPasswordService: appWriteAuthService);
  return GetXAuthPresenter(
    performAuthenticationWithAppWrite: authUsecaseWithAppwrite,
    performAuthenticationWithFirebase: authUsecaseWithFirebase,
  );
}
