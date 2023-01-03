// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'build_log_bloc.freezed.dart';
part 'build_log_event.dart';
part 'build_log_state.dart';

class BuildLogBloc extends Bloc<BuildLogEvent, BuildLogState> {
  BuildLogBloc({
    required RepoRepository repoRepository,
    required this.params,
  })  : _repoRepository = repoRepository,
        super(const _Initial()) {
    _subscription = repoRepository
        .logStream(
      build: params.number,
      stage: params.stage,
      step: params.step,
      owner: params.owner,
      repoName: params.name,
    )
        .listen(
      (event) {
        add(_NewLog(log: event.log));
      },
      onError: (_) {
        add(const _Started());
      },
      cancelOnError: true,
    );

    on<_Started>(_onStarted);
    on<_NewLog>(_onNewLog);
  }

  final RepoRepository _repoRepository;
  late final StreamSubscription<DroneLogEvent> _subscription;

  final BuildLogBlocParams params;

  Future<void> _onStarted(_Started event, Emitter<BuildLogState> emit) async {
    emit(const _Loading());

    try {
      final data = await _repoRepository.getRepoBuildLogInfo(
        build: params.number,
        stage: params.stage,
        step: params.step,
        owner: params.owner,
        repoName: params.name,
      );
      emit(_Success(logs: data));
    } catch (e) {
      if (e is DroneException) {
        emit(_Failure(message: e.message));
        return;
      }
      emit(_Failure(message: '$e'));
    }
  }

  Future<void> _onNewLog(
    _NewLog event,
    Emitter<BuildLogState> emit,
  ) async {
    final st = state.whenOrNull(
      success: (logs) => logs,
    );

    emit(_Success(logs: [...st ?? [], event.log]));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}

class BuildLogBlocParams {
  const BuildLogBlocParams({
    required this.stage,
    required this.step,
    required this.owner,
    required this.name,
    required this.number,
  });

  final String stage;
  final String step;
  final String owner;
  final String name;
  final int number;
}
