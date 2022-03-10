import 'package:domain/domain.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetXAuthPresenter extends GetxController implements AuthPresenter {
  final PerformAuthentication performAuthenticationWithFirebase;
  final PerformAuthentication performAuthenticationWithAppWrite;
  GetXAuthPresenter({
    required this.performAuthenticationWithFirebase,
    required this.performAuthenticationWithAppWrite,
  });

  String _username = '';
  String _password = '';

  @override
  Future<AuthenticationOutput> auth({
    required AuthenticationInput params,
    required AuthServiceEnum serviceToUse,
  }) async {
    switch (serviceToUse) {
      case AuthServiceEnum.appwrite:
        return performAuthenticationWithAppWrite(
          user: AuthenticationInput(
            username: _username,
            password: _password,
          ),
        );
      case AuthServiceEnum.firebase:
        return performAuthenticationWithFirebase(
          user: AuthenticationInput(
            username: _username,
            password: _password,
          ),
        );
      default:
        return performAuthenticationWithFirebase(user: params);
    }
  }

  @override
  Stream<User> listenUserChanges() {
    print('User changed');
    return Stream.empty();
  }

  @override
  void inputPassword(String? password) {
    _password = password ?? '';
  }

  @override
  void inputUsername(String? username) {
    _username = username ?? '';
  }
}
