import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'build_log_event.dart';
part 'build_log_state.dart';
part 'build_log_bloc.freezed.dart';

class BuildLogBloc extends Bloc<BuildLogEvent, BuildLogState> {
  BuildLogBloc({required RepoRepository repoRepository})
      : _repoRepository = repoRepository,
        super(const _Initial()) {
    on<_Started>(_onStarted);
  }

  final RepoRepository _repoRepository;

  Future<void> _onStarted(_Started event, Emitter<BuildLogState> emit) async {
    emit(const _Loading());

    try {
      final data = await _repoRepository.getRepoBuildLogInfo(
        build: event.number,
        stage: event.stage,
        step: event.step,
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(_Success(logs: data));
    } catch (e) {
      emit(_Failure(message: '$e'));
    }
  }
}
