import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'builds_bloc.freezed.dart';
part 'builds_event.dart';
part 'builds_state.dart';

class BuildsBloc extends Bloc<BuildsEvent, BuildsState> {
  BuildsBloc({
    required RepoRepository repoRepository,
  })  : _repoRepository = repoRepository,
        super(
          const BuildsState(
            status: Status.initial,
            builds: [],
            isReachedMax: false,
            isLoadingMore: false,
          ),
        ) {
    _streamSubscription = _repoRepository.newRepoEvent.listen((event) {
      if (event != null) {
        add(_NewBuild(repo: event.repo));
      }
    });

    on<_Started>(_onStarted);
    on<_LoadMoreBuilds>(_onLoadMoreBuilds);
    on<_NewBuild>(_onNewBuild);
  }

  final RepoRepository _repoRepository;
  late final StreamSubscription<DroneEvent?> _streamSubscription;

  Future<void> _onStarted(
    _Started event,
    Emitter<BuildsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final builds = await _repoRepository.getRepoBuilds(
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(
        state.copyWith(
          status: Status.success,
          builds: builds,
          isReachedMax: builds.length < 25,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _onLoadMoreBuilds(
    _LoadMoreBuilds event,
    Emitter<BuildsState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoadingMore: true));
      final builds = await _repoRepository.getRepoBuilds(
        page: state.builds.length ~/ 25 + 1,
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(
        state.copyWith(
          isLoadingMore: false,
          status: Status.success,
          builds: [...state.builds, ...builds],
          isReachedMax: builds.length < 25,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure, isLoadingMore: false));
    }
  }

  Future<void> _onNewBuild(_NewBuild event, Emitter<BuildsState> emit) async {
    final isInList = state.builds.firstWhereOrNull(
      (element) => element.id == event.repo.build!.id,
    );

    emit(
      state.copyWith(
        builds: [
          event.repo.build!,
          if (isInList == null)
            ...state.builds
          else
            ...state.builds
                .where((element) => element.id != event.repo.build!.id)
        ],
        latestRepo: event.repo,
      ),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
