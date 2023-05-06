part of 'setting_bloc.dart';

@freezed
class SettingState with _$SettingState, FormzMixin {
  const factory SettingState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(TokenField.pure()) TokenField token,
    @Default(ServerField.pure()) ServerField server,
    @Default(NickNameField.pure()) NickNameField nickName,
    @Default(false) bool isNotificationEnable,
    @Default(false) bool inNewUser,
    String? errorMessage,
  }) = _SettingState;

  factory SettingState.fromUser(User user) {
    return SettingState(
      status: FormzSubmissionStatus.initial,
      server: ServerField.pure(user.server),
      nickName: NickNameField.pure(user.nickName),
      token: TokenField.pure(user.token),
      isNotificationEnable: user.isNotificationEnable,
    );
  }

  const SettingState._();

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
        token,
        server,
        nickName,
      ];
}
