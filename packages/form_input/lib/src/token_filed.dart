import 'package:formz/formz.dart';

enum TokenFieldError {
  invalid('Please enter valid Token');

  const TokenFieldError(this.text);
  final String text;
}

class TokenField extends FormzInput<String, TokenFieldError> {
  const TokenField.dirty([String value = '']) : super.dirty(value);
  const TokenField.pure([String value = '']) : super.pure(value);

  @override
  TokenFieldError? validator(String value) {
    return value.length >= 8 ? null : TokenFieldError.invalid;
  }
}
