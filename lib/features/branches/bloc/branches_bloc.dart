import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'branches_event.dart';
part 'branches_state.dart';
part 'branches_bloc.freezed.dart';

class BranchesBloc extends Bloc<BranchesEvent, BranchesState> {
  BranchesBloc({required this.repoRepository}) : super(const _Initial()) {
    on<_Started>(_onStarted);
  }

  final RepoRepository repoRepository;

  Future<void> _onStarted(_Started event, Emitter<BranchesState> emit) async {
    emit(const _Loading());
    try {
      final branches = await repoRepository.getRepoBranches(
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(_Success(branches: branches));
    } on DroneException catch (e) {
      emit(_Failure(message: e.message));
    } catch (e) {
      emit(_Failure(message: e.toString()));
    }
  }
}
