part of 'build_log_bloc.dart';

@freezed
class BuildLogState with _$BuildLogState {
  const factory BuildLogState.initial() = _Initial;
  const factory BuildLogState.loading() = _Loading;
  const factory BuildLogState.success({required List<DroneLog> logs}) =
      _Success;
  const factory BuildLogState.failure({required String message}) = _Failure;
}
