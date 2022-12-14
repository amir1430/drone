part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(ServerField.pure()) ServerField server,
    @Default(TokenField.pure()) TokenField token,
    @Default(NickNameField.pure()) NickNameField nickName,
    Color? color,
    String? error,
  }) = _LoginState;
}

Color _randomColor() {
  const colors = [
    Color.fromARGB(255, 247, 123, 114),
    Color.fromARGB(255, 149, 243, 255),
    Color.fromARGB(255, 107, 182, 243),
    Color.fromARGB(255, 131, 148, 245),
    Color.fromARGB(255, 235, 114, 154),
    Color.fromARGB(255, 237, 134, 255),
    Color.fromARGB(255, 255, 231, 159),
    Color.fromARGB(255, 187, 187, 187),
  ];
  return colors[Random().nextInt(7)];
}
