import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
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
    repoRepository.client = authRepository.currentUser!.client;

    _appStateSubscription =
        authRepository.authenticationStatus.listen((status) {
      status.whenOrNull(
        authenticated: (accounts, currentAccount) {
          repoRepository.client = currentAccount.client;
          add(const _Started());
        },
      );
    });

    on<_Started>(_onStarted, transformer: restartable());
    on<_OnSearched>(_onSearched);
    on<_FilterChanged>(_onFilterChanged);
  }

  late final StreamSubscription<AuthenticationStatus> _appStateSubscription;

  final RepoRepository repoRepository;
  final AuthRepository authRepository;

  Future<void> _onStarted(
    _Started event,
    Emitter<HomeState> emit,
  ) async {
    repoRepository.client = authRepository.currentUser!.client;

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
  }

  Future<void> _onSearched(
    _OnSearched event,
    Emitter<HomeState> emit,
  ) async {
    final _filterdRepos =
        state.repos.where((element) => element.name.contains(event.value));
    emit(state.copyWith(homeRepos: [..._filterdRepos]));
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
    await _appStateSubscription.cancel();
    return super.close();
  }
}
