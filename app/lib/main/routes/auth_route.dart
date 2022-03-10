import 'package:app/authentication/ui/pages/auth_page.dart';
import 'package:app/main/di/auth/auth_page_factory.dart';
import 'package:get/get.dart';

GetPage makeAuthRoute() => GetPage(
      name: AuthPage.routeName,
      page: makeAuthPage,
    );
