part of 'repo_setting_bloc.dart';

@freezed
class RepoSettingsEvent with _$RepoSettingsEvent {
  const factory RepoSettingsEvent.started({
    required String owner,
    required String repoName,
  }) = _Started;

  const factory RepoSettingsEvent.activeRepoRequested({
    required String owner,
    required String repoName,
  }) = _ActiveRepoRequested;

  const factory RepoSettingsEvent.disableRepoRequested({
    required String owner,
    required String repoName,
  }) = _DisableRepoRequested;

  const factory RepoSettingsEvent.updateRepoRequested({
    required String owner,
    required String repoName,
  }) = _UpdateRepoRequested;

  const factory RepoSettingsEvent.disablePullRequestClicked() =
      _DisablePullRequestClicked;

  const factory RepoSettingsEvent.disableForksClicked() = _DisableForksClicked;

  const factory RepoSettingsEvent.changeProtectedClicked() =
      _ChangeProtectedClicked;

  const factory RepoSettingsEvent.changeTrustedClicked() =
      _ChangeTrustedClicked;

  const factory RepoSettingsEvent.changeAutoCancelPullRequestsClicked() =
      _ChangeAutoCancelPullRequestsClicked;

  const factory RepoSettingsEvent.changeAutoCancelPushesClicked() =
      _ChangeAutoCancelPushesClicked;

  const factory RepoSettingsEvent.changeVisibilityClicked({
    required Visibility visibility,
  }) = _ChangeVisibilityClicked;

  const factory RepoSettingsEvent.configPathChanged({
    required String value,
  }) = _ConfigPathChanged;

  const factory RepoSettingsEvent.changeTimeout({required Timeout timeout}) =
      _ChangeTimeout;
}
