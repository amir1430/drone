import 'package:formz/formz.dart';

enum NickNameFieldError {
  invalid('Please enter valid nick name');

  const NickNameFieldError(this.text);
  final String text;
}

class NickNameField extends FormzInput<String, NickNameFieldError> {
  const NickNameField.dirty([String value = '']) : super.dirty(value);
  const NickNameField.pure([String value = '']) : super.pure(value);

  @override
  NickNameFieldError? validator(String value) {
    if (value.isEmpty) {
      return null;
    }
    if (value.length < 4) {
      return NickNameFieldError.invalid;
    }
    return null;
  }
}
