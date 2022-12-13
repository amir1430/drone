part of 'deployments_bloc.dart';

@freezed
class DeploymentsState with _$DeploymentsState {
  const factory DeploymentsState.initial() = _Initial;
  const factory DeploymentsState.loading() = _Loading;
  const factory DeploymentsState.success({
    required List<DroneBuild> deployments,
  }) = _Success;
  const factory DeploymentsState.failure({required String message}) = _Failure;
}
