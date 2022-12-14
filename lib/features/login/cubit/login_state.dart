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
  final colors = [
    Colors.red,
    Colors.cyan,
    Colors.blue,
    Colors.indigo,
    Colors.pink,
    Colors.purple,
    Colors.amber,
    Colors.grey,
  ];
  return colors[Random().nextInt(7)];
}
