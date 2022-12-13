import 'package:formz/formz.dart';

enum ServerFieldError {
  invalid('Please enter valid Url');

  const ServerFieldError(this.text);
  final String text;
}

class ServerField extends FormzInput<String, ServerFieldError> {
  const ServerField.dirty([String value = '']) : super.dirty(value);
  const ServerField.pure([String value = '']) : super.pure(value);

  static final String _reg =
      r"[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)";
  // static bool _isServerValid(String value) {
  //   return Uri.parse(value).isAbsolute;
  // }

  @override
  ServerFieldError? validator(String value) {
    return RegExp(_reg).hasMatch(value) ? null : ServerFieldError.invalid;
  }
}
