part of 'build_bloc.dart';

@freezed
class BuildState with _$BuildState {
  const factory BuildState.initial() = _Initial;
  const factory BuildState.loading() = _Loading;
  const factory BuildState.success({required DroneBuild build}) = _Success;
  const factory BuildState.failure({required String message}) = _Failure;
}
