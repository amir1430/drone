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
    // _streamSubscription = appBloc.stream.listen((event) {
    //   event.mapOrNull(
    //     authenticated: (value) {
    //       reposRepository =
    //           RepoRepository(remoteDataSource: value.currentClient);
    //       add(const ReposEvent.started());
    //     },
    //   );
    // });
    // reposRepository.init();
    on<_Started>(_onStarted);
    on<_UpdateRepo>(_onUpdateRepo);
  }

  RepoRepository? reposRepository;
  final AppBloc appBloc;
  late final StreamSubscription<AppState> _streamSubscription;

  Future<void> _onStarted(
    _Started event,
    Emitter<ReposState> emit,
  ) async {
    emit(const _Loading());
    try {
      // print(reposRepository.remoteDataSource);
      final repos = await reposRepository?.getAllRepos();
      emit(_Loaded(repos: repos ?? []));
    } catch (e) {
      emit(_Failure(error: '$e'));
    }

    // await emit.forEach<List<DroneRepo>>(
    //   reposRepository.reposStream,
    //   onData: (repos) {
    //     return _Loaded(repos: repos);
    //   },
    //   onError: (e, s) {
    //     if (e is DroneException) {
    //       return _Failure(error: e.message);
    //     }
    //     return _Failure(error: e.toString());
    //   },
    // );
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
    _streamSubscription.cancel();
    return super.close();
  }
}
