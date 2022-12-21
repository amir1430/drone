part of 'build_log_bloc.dart';

@freezed
class BuildLogEvent with _$BuildLogEvent {
  const factory BuildLogEvent.started() = _Started;

  const factory BuildLogEvent.bewLog({required DroneLog log}) = _NewLog;
}
