part of 'builds_bloc.dart';

enum Status { initial, loading, success, failure }

@freezed
class BuildsState with _$BuildsState {
  const factory BuildsState({
    required Status status,
    required List<DroneBuild> builds,
    DroneRepo? latestRepo,
    required bool isReachedMax,
    required bool isLoadingMore,
  }) = _BuildsState;
}

extension BuildsStateX on BuildsState {
  DroneBuild get latestBuild => builds.first;
}
