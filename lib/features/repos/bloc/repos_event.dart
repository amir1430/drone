part of 'repos_bloc.dart';

@freezed
class ReposEvent with _$ReposEvent {
  const factory ReposEvent.started() = _Started;
  const factory ReposEvent.updateRepo({required DroneRepo repo}) = _UpdateRepo;

  // const factory ReposEvent.fetchRequsted() = _FetchRequsted;
}
