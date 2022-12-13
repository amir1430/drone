part of 'build_log_bloc.dart';

@freezed
class BuildLogEvent with _$BuildLogEvent {
  const factory BuildLogEvent.started({
    required int number,
    required String stage,
    required String step,
    required String owner,
    required String repoName,
  }) = _Started;
}
