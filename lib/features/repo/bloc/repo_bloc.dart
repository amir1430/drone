import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'repo_event.dart';
part 'repo_state.dart';
part 'repo_bloc.freezed.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  RepoBloc({
    required this.repoRepository,
    // required this.repo,
  }) : super(const _Initial()) {
    on<_Started>(_onStarted);
    //   on<_GetRepoSettingsRequsted>(_onGetRepoSettingsRequsted);
    //   on<_GetRepoBuildsRequsted>(_onGetRepoBuildsRequsted);
    //   on<_GetRepoDeploymentsRequsted>(_onGetRepoDeploymentsRequsted);
    //   on<_GetRepoBranchesRequsted>(_onGetRepoBranchesRequsted);
  }

  final RepoRepository repoRepository;
  // final DroneRepo repo;

  Future<void> _onStarted(
    _Started event,
    Emitter<RepoState> emit,
  ) async {
    // emit(const _Loading());
    // try {
    //   final data = await Future.wait([
    //     repoRepository.getRepoBranches(),
    //     repoRepository.getRepoBuilds(),
    //     repoRepository.getRepoDeployments(),
    //     repoRepository.getRepoSetting(),
    //   ]);
    //   emit(_Success(
    //     branches: data[0] as List<DroneBuild>,
    //     builds: data[1] as List<DroneBuild>,
    //     deployments: data[2] as List<DroneBuild>,
    //     repo: data[3] as DroneRepo,
    //   ));
    // } on DroneException catch (e) {
    //   emit(_Failure(message: e.message));
    // } catch (e) {
    //   emit(_Failure(message: '$e'));
    // }
  }

  // Future<void> _onGetRepoSettingsRequsted(
  //   _GetRepoSettingsRequsted event,
  //   Emitter<RepoState> emit,
  // ) async {
  //   emit(state.copyWith(isLoading: true));
  //   try {
  //     final settings = await repoRepository.getRepoSetting(
  //       owner: state.repo.namespace,
  //       repo: state.repo.name,
  //     );
  //     emit(state.copyWith(repo: settings));
  //   } on DroneException catch (e) {
  //     emit(state.copyWith(hasError: true, error: e.message));
  //   } catch (e) {
  //     emit(state.copyWith(hasError: true, error: '$e'));
  //   } finally {
  //     emit(state.copyWith(isLoading: false, hasError: false, error: null));
  //   }
  // }

  // Future<void> _onGetRepoBuildsRequsted(
  //   _GetRepoBuildsRequsted event,
  //   Emitter<RepoState> emit,
  // ) async {
  //   emit(state.copyWith(isLoading: true));
  //   try {
  //     final builds = await repoRepository.getRepoBuilds(
  //       owner: state.repo.namespace,
  //       repo: state.repo.name,
  //     );
  //     emit(state.copyWith(builds: builds));
  //   } on DroneException catch (e) {
  //     emit(state.copyWith(hasError: true, error: e.message));
  //   } catch (e) {
  //     emit(state.copyWith(hasError: true, error: '$e'));
  //   } finally {
  //     emit(state.copyWith(isLoading: false, hasError: false, error: null));
  //   }
  // }

  // Future<void> _onGetRepoDeploymentsRequsted(
  //   _GetRepoDeploymentsRequsted event,
  //   Emitter<RepoState> emit,
  // ) async {
  //   emit(state.copyWith(isLoading: true));
  //   try {
  //     final deployments = await repoRepository.getRepoDeployments(
  //       owner: state.repo.namespace,
  //       repo: state.repo.name,
  //     );
  //     emit(state.copyWith(deployments: deployments));
  //   } on DroneException catch (e) {
  //     emit(state.copyWith(hasError: true, error: e.message));
  //   } catch (e) {
  //     emit(state.copyWith(hasError: true, error: '$e'));
  //   } finally {
  //     emit(state.copyWith(isLoading: false, hasError: false, error: null));
  //   }
  // }

  // Future<void> _onGetRepoBranchesRequsted(
  //   _GetRepoBranchesRequsted event,
  //   Emitter<RepoState> emit,
  // ) async {
  //   emit(state.copyWith(isLoading: true));
  //   try {
  //     final branches = await repoRepository.getRepoBranches(
  //       owner: state.repo.namespace,
  //       repo: state.repo.name,
  //     );
  //     emit(state.copyWith(branches: branches));
  //   } on DroneException catch (e) {
  //     emit(state.copyWith(hasError: true, error: e.message));
  //   } catch (e) {
  //     emit(state.copyWith(hasError: true, error: '$e'));
  //   } finally {
  //     emit(state.copyWith(isLoading: false, hasError: false, error: null));
  //   }
  // }

  // Future<T> _getData<T>(Future<T> future, Emitter<RepoState> emit) async {
  //   emit(state.copyWith(isLoading: true));
  //   late T data;
  //   try {
  //     data = await future;
  //   } on DroneException catch (e) {
  //     emit(state.copyWith(hasError: true, error: e.message));
  //   } catch (e) {
  //     emit(state.copyWith(hasError: true, error: '$e'));
  //   } finally {
  //     emit(state.copyWith(isLoading: false, hasError: false, error: null));
  //   }
  //   return data;
  // }
}
