part of 'setting_bloc.dart';

@freezed
class SettingEvent with _$SettingEvent {
  const factory SettingEvent.started() = _Started;
  const factory SettingEvent.logoutRequested({
    required User user,
  }) = _LogoutRequested;
  const factory SettingEvent.changeUser({
    required User user,
    int? color,
  }) = _ChangeUser;

  const factory SettingEvent.addNewUser() = _AddNewUser;

  const factory SettingEvent.tokenChanged(String value) = _TokenChanged;
  const factory SettingEvent.serverChanged(String value) = _ServerChanged;
  const factory SettingEvent.nickNameChanged(String value) = _NickNameChanged;
  const factory SettingEvent.updateUser({
    required User user,
  }) = _UpdateUser;
  const factory SettingEvent.changeIsNotificationEnable({required bool value}) =
      _ChangeIsNotificationEnable;
}
