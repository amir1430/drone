part of 'build_bloc.dart';

@freezed
class BuildEvent with _$BuildEvent {
  const factory BuildEvent.started({
    required String owner,
    required String repoName,
    required int number,
  }) = _Started;
}
