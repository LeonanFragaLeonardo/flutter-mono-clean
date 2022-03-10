import 'package:app/authentication/ui/pages/auth_page.dart';
import 'package:app/main/di/auth/auth_presenter_factory.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makeAuthPage() {
  final presenter = Get.put<AuthPresenter>(makeGetXAuthPresenter());
  return AuthPage(
    presenter: presenter,
  );
}
