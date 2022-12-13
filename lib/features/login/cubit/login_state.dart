part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(ServerField.pure()) ServerField server,
    @Default(TokenField.pure()) TokenField token,
    String? error,
  }) = _LoginState;
  // const factory LoginState.initial() = _Initial;
  // const factory LoginState.loading() = _Loading;
  // const factory LoginState.success() = _Success;
  // const factory LoginState.failure({required String error}) = _Failure;
}
