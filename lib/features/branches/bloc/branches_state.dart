part of 'branches_bloc.dart';

@freezed
class BranchesState with _$BranchesState {
  const factory BranchesState.initial() = _Initial;
  const factory BranchesState.loading() = _Loading;
  const factory BranchesState.success({required List<DroneBuild> branches}) =
      _Success;
  const factory BranchesState.failure({required String message}) = _Failure;
}
