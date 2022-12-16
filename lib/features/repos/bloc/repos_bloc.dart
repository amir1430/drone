import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drone/features/app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'repos_event.dart';
part 'repos_state.dart';
part 'repos_bloc.freezed.dart';

class ReposBloc extends Bloc<ReposEvent, ReposState> {
  ReposBloc({required this.appBloc}) : super(const _Initial()) {
    on<_Started>(_onStarted);
    on<_UpdateRepo>(_onUpdateRepo);
  }

  RepoRepository? reposRepository;
  final AppBloc appBloc;

  Future<void> _onStarted(
    _Started event,
    Emitter<ReposState> emit,
  ) async {
    emit(const _Loading());
    try {
      final repos = await reposRepository?.getAllRepos();
      emit(_Loaded(repos: repos ?? []));
    } catch (e) {
      emit(_Failure(error: '$e'));
    }
  }

  Future<void> _onUpdateRepo(
    _UpdateRepo event,
    Emitter<ReposState> emit,
  ) async {
    final latestState = state.whenOrNull(
      loaded: (repos) => repos.where((element) => element.id != event.repo.id),
    );
    if (latestState != null) {
      emit(_Loaded(repos: [event.repo, ...latestState]));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
