part of 'repo_setting_bloc.dart';

@freezed
class RepoSettingsState with _$RepoSettingsState {
  const factory RepoSettingsState.initial() = _Initial;
  const factory RepoSettingsState.loading() = _Loading;
  const factory RepoSettingsState.success({required DroneRepo repo}) = _Success;
  const factory RepoSettingsState.failure({required String message}) = _Failure;
}

extension RepoSettingsStateX on RepoSettingsState {
  DroneRepo? get repo => whenOrNull(success: (repo) => repo);
}

enum Timeout {
  m15(15, '15 minutes'),
  m30(30, '30 minutes'),
  m60(60, '60 minutes'),
  m90(90, '90 minutes'),
  h2(120, '2 hours'),
  h3(180, '3 hours'),
  h4(240, '4 hours'),
  h5(300, '5 hours'),
  h6(360, '6 hours'),
  h7(420, '7 hours'),
  h8(480, '8 hours'),
  h9(540, '9 hours'),
  h10(600, '10 hours'),
  h11(660, '11 hours'),
  h12(720, '12 hours'),
  h18(1080, '18 hours'),
  h24(1440, '24 hours'),
  h48(2880, '48 hours'),
  h72(4320, '72 hours');

  const Timeout(this.value, this.text);
  final int value;
  final String text;
}

extension IntX on int {
  Timeout get toTimeout => Timeout.values.firstWhere(
        (value) => value.value == this,
        orElse: () => Timeout.m15,
      );
}
