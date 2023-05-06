import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.authRepository,
    required this.repoRepository,
  }) : super(const _HomeState()) {
    _appStateSubscription =
        authRepository.authenticationStatus.listen((status) {
      status.whenOrNull(
        authenticated: (accounts, currentAccount) {
          add(const _Started());
        },
      );
    });

    on<_Started>(_onStarted, transformer: restartable());
    on<_OnSearched>(_onSearched);
    on<_FilterChanged>(_onFilterChanged);
    on<_SyncRepos>(_onSyncRepos);
  }

  late final StreamSubscription<AuthenticationStatus> _appStateSubscription;

  final RepoRepository repoRepository;
  final AuthRepository authRepository;

  Future<void> _onStarted(
    _Started event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final repos = await repoRepository.getAllRepos();

      emit(
        state.copyWith(
          repos: [...repos],
          homeRepos: [...repos],
          drawerRepos: [...repos],
          status: HomeStatus.success,
          filter: DrawerFilter.all,
        ),
      );
    } on DroneException catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          failureMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          failureMessage: '$e',
        ),
      );
    }

    await emit.forEach(
      repoRepository.newRepoEvent,
      onData: (DroneEvent? droneEvent) {
        if (droneEvent == null) {
          return state;
        }
        final repos0 = state.repos;
        final isInRepos = repos0
            .firstWhereOrNull((element) => element.id == droneEvent.repo.id);
        final newRepo = <DroneRepo>[
          droneEvent.repo,
          if (isInRepos == null)
            ...repos0
          else
            ...repos0.where(
              (element) => element.id != isInRepos.id,
            )
        ];

        return state.copyWith(
          repos: [...newRepo],
          drawerRepos: [...newRepo],
          homeRepos: [...newRepo],
        );
      },
    );
  }

  Future<void> _onSearched(
    _OnSearched event,
    Emitter<HomeState> emit,
  ) async {
    final filterdRepos =
        state.repos.where((element) => element.name.contains(event.value));
    emit(state.copyWith(homeRepos: [...filterdRepos]));
  }

  Future<void> _onFilterChanged(
    _FilterChanged event,
    Emitter<HomeState> emit,
  ) async {
    final drawerRepos = state.repos.drawerFilter(event.filter);

    emit(state.copyWith(filter: event.filter, drawerRepos: drawerRepos));
  }

  @override
  Future<void> close() async {
    await repoRepository.close();
    await _appStateSubscription.cancel();
    // await _droneEventSubscription.cancel();
    return super.close();
  }

  Future<void> _onSyncRepos(
    _SyncRepos event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(syncStatus: HomeStatus.loading));

    try {
      await repoRepository.syncRepos();
      final repos = await repoRepository.getAllRepos();
      emit(
        state.copyWith(
          syncStatus: HomeStatus.success,
          repos: [...repos],
          homeRepos: [...repos],
          drawerRepos: [...repos],
        ),
      );
    } on DroneException catch (e) {
      emit(
        state.copyWith(
          syncStatus: HomeStatus.failure,
          failureMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          syncStatus: HomeStatus.failure,
          failureMessage: e.toString(),
        ),
      );
    }
  }
}
