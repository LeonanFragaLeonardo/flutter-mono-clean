import 'package:domain/src/exceptions/business_exceptions.dart';

class InvalidCredentialsException extends BusinessException {
  InvalidCredentialsException() : super('AUTH_001');
}
