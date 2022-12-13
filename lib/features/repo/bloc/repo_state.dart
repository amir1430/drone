part of 'repo_bloc.dart';

@freezed
class RepoState with _$RepoState {
  const factory RepoState.initial() = _Initial;
  const factory RepoState.loading() = _Loading;
  const factory RepoState.success({
    required List<DroneBuild> builds,
    required List<DroneBuild> deployments,
    required List<DroneBuild> branches,
    required DroneRepo repo,
  }) = _Success;
  const factory RepoState.failure({required String message}) = _Failure;

  // const factory RepoState({
  //   bool? hasError,
  //   String? error,
  //   required bool isLoading,
  //   required List<DroneBuild> builds,
  //   required List<DroneBuild> deployments,
  //   required List<DroneBuild> branches,
  //   required DroneRepo repo,
  // }) = _RepoState;
}

// extension RepoStateX on _Success {
//   bool get isActive => repo.active;
// }

extension DroneBuildX on DroneBuild {
  String get afterId => after.substring(0, 8);
}
