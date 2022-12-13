part of 'branches_bloc.dart';

@freezed
class BranchesEvent with _$BranchesEvent {
  const factory BranchesEvent.started({
    required String owner,
    required String repoName,
  }) = _Started;
}
