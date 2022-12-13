part of 'setting_bloc.dart';

@freezed
class SettingEvent with _$SettingEvent {
  const factory SettingEvent.started() = _Started;
  const factory SettingEvent.logoutRequested({
    required Account account,
  }) = _LogoutRequested;
  const factory SettingEvent.changeUser({
    required Account account,
  }) = _ChangeUser;

  const factory SettingEvent.addNewUser() = _AddNewUser;

  const factory SettingEvent.tokenChanged(String value) = _TokenChanged;
  const factory SettingEvent.serverChanged(String value) = _ServerChanged;
  const factory SettingEvent.updateAccount({
    required Account account,
  }) = _UpdateAccount;
}
