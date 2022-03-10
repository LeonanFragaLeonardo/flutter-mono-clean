import 'package:app/authentication/ui/components/error_alert_dialog.dart';
import 'package:app/home/ui/pages/home_page.dart';
import 'package:app/main.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = '/login';
  final AuthPresenter presenter;
  const AuthPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple[50],
        child: Column(
          children: [
            TextField(
              onChanged: widget.presenter.inputUsername,
            ),
            TextField(
              onChanged: widget.presenter.inputPassword,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await widget.presenter.auth(
                        params: AuthenticationInput(
                          username: 'leonan@becomeholonic.com',
                          password: 'Teste@123',
                        ),
                        serviceToUse: AuthServiceEnum.firebase,
                      );
                      MainApp.serviceToUse = AuthServiceEnum.firebase;
                      Get.toNamed(HomePage.routeName);
                    } on InvalidCredentialsException catch (e) {
                      showErrorDialog(context, 'Invalid username or password');
                    }
                  },
                  child: Text(
                    'Login with Firebase',
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await widget.presenter.auth(
                        params: AuthenticationInput(
                          username: 'leonan@becomeholonic.com',
                          password: 'Teste@123',
                        ),
                        serviceToUse: AuthServiceEnum.appwrite,
                      );
                      Get.toNamed(HomePage.routeName);

                      MainApp.serviceToUse = AuthServiceEnum.appwrite;
                    } on InvalidCredentialsException catch (e) {
                      showErrorDialog(context, 'Invalid username or password');
                    }
                  },
                  child: Text(
                    'Login with AppWrite',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
