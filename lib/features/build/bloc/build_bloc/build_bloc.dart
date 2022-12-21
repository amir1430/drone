import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'build_event.dart';
part 'build_state.dart';
part 'build_bloc.freezed.dart';

class BuildBloc extends Bloc<BuildEvent, BuildState> {
  BuildBloc({required RepoRepository repository})
      : _repository = repository,
        super(const _Initial()) {
    on<_Started>(_onStarted);
  }

  final RepoRepository _repository;

  Future<void> _onStarted(
    _Started event,
    Emitter<BuildState> emit,
  ) async {
    emit(const _Loading());
    try {
      final _info = await _repository.getRepoBuildInfo(
        build: event.number,
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(_Success(build: _info));
    } on DroneException catch (e) {
      emit(_Failure(message: e.message));
    } catch (e) {
      emit(_Failure(message: '$e'));
    }

    await emit.forEach<DroneEvent?>(
      _repository.newRepoEvent
          .where((e) => e?.repo.build?.number == event.number),
      onData: (data) {
        if (data == null) {
          return state;
        }
        return _Success(build: data.repo.build!);
      },
    );
  }
}
