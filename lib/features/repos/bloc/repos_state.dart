part of 'repos_bloc.dart';

@freezed
class ReposState with _$ReposState {
  const factory ReposState.initial() = _Initial;
  const factory ReposState.loading() = _Loading;
  const factory ReposState.loaded({
    required List<DroneRepo> repos,
  }) = _Loaded;
  const factory ReposState.failure({required String error}) = _Failure;
}

extension LoadedX on List<DroneRepo> {
  List<DroneRepo> get reposWithBuild => [...where((repo) => repo.build != null)]
    ..sort((a, b) => b.build!.started.compareTo(a.build!.started));
}
