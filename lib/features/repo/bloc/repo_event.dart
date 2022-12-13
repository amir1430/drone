part of 'repo_bloc.dart';

@freezed
class RepoEvent with _$RepoEvent {
  const factory RepoEvent.started() = _Started;
  const factory RepoEvent.getRepoSettingsRequsted() = _GetRepoSettingsRequsted;
  const factory RepoEvent.getRepoBuildsRequsted() = _GetRepoBuildsRequsted;
  const factory RepoEvent.getRepoDeploymentsRequsted() =
      _GetRepoDeploymentsRequsted;
  const factory RepoEvent.getRepoBranchesRequsted() = _GetRepoBranchesRequsted;
}
