import 'package:domain/src/inputs/authentication_input.dart';
import 'package:domain/src/outputs/authentication_output.dart';

abstract class PerformAuthentication {
  Future<AuthenticationOutput> call({AuthenticationInput user});
}
