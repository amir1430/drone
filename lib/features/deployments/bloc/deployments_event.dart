part of 'deployments_bloc.dart';

@freezed
class DeploymentsEvent with _$DeploymentsEvent {
  const factory DeploymentsEvent.started({
    required String owner,
    required String repoName,
  }) = _Started;
}
