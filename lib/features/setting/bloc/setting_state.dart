part of 'setting_bloc.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(TokenField.pure()) TokenField token,
    @Default(ServerField.pure()) ServerField server,
    @Default(false) bool inNewUser,
    String? errorMessage,
  }) = _SettingState;

  factory SettingState.fromAccount(Account account) {
    return SettingState(
      status: FormzStatus.pure,
      server: ServerField.pure(account.user.server),
      token: TokenField.pure(account.user.token),
    );
  }

  const SettingState._();
}