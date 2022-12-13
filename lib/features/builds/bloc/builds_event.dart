part of 'builds_bloc.dart';

@freezed
class BuildsEvent with _$BuildsEvent {
  const factory BuildsEvent.started({
    required String owner,
    required String repoName,
  }) = _Started;
  const factory BuildsEvent.loadMoreBuilds({
    required String owner,
    required String repoName,
  }) = _LoadMoreBuilds;
  const factory BuildsEvent.newBuild({required DroneRepo repo}) = _NewBuild;
}
