import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'repo_setting_bloc.freezed.dart';
part 'repo_setting_event.dart';
part 'repo_setting_state.dart';

class RepoSettingsBloc extends Bloc<RepoSettingsEvent, RepoSettingsState> {
  RepoSettingsBloc({
    required this.repoRepository,
  }) : super(const _Initial()) {
    on<_Started>(_onStarted);
    on<_ActiveRepoRequested>(_onActiveRepoRequested);
    on<_DisableRepoRequested>(_onDisableRepoRequested);
    on<_UpdateRepoRequested>(_onUpdateRepoRequested);
    on<_DisablePullRequestClicked>(_onDisablePullRequestClicked);
    on<_DisableForksClicked>(_onDisableForksClicked);
    on<_ChangeProtectedClicked>(_onChangeProtectedClicked);
    on<_ChangeTrustedClicked>(_onChangeTrustedClicked);
    on<_ChangeAutoCancelPullRequestsClicked>(
      _onChangeAutoCancelPullRequestsClicked,
    );
    on<_ChangeAutoCancelPushesClicked>(_onChangeAutoCancelPushesClicked);
    on<_ChangeVisibilityClicked>(_onChangeVisibilityClicked);
    on<_ConfigPathChanged>(_onConfigPathChanged);
    on<_ChangeTimeout>(_onChangeTimeout);
  }

  final RepoRepository repoRepository;

  Future<void> _onStarted(
    _Started event,
    Emitter<RepoSettingsState> emit,
  ) async {
    emit(const _Loading());
    try {
      final repo = await repoRepository.getRepoSetting(
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(_Success(repo: repo));
    } on DroneException catch (e) {
      emit(_Failure(message: e.message));
    } catch (e) {
      emit(_Failure(message: e.toString()));
    }
  }

  Future<void> _onActiveRepoRequested(
    _ActiveRepoRequested event,
    Emitter<RepoSettingsState> emit,
  ) async {
    emit(const _Loading());
    try {
      final repo = await repoRepository.enableRepo(
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(_Success(repo: repo));
    } on DroneException catch (e) {
      emit(_Failure(message: e.message));
    } catch (e) {
      emit(_Failure(message: e.toString()));
    }
  }

  Future<void> _onDisableRepoRequested(
    _DisableRepoRequested event,
    Emitter<RepoSettingsState> emit,
  ) async {
    emit(const _Loading());
    try {
      final repo = await repoRepository.disableRepo(
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(_Success(repo: repo));
    } on DroneException catch (e) {
      emit(_Failure(message: e.message));
    } catch (e) {
      emit(_Failure(message: e.toString()));
    }
  }

  Future<void> _onUpdateRepoRequested(
    _UpdateRepoRequested event,
    Emitter<RepoSettingsState> emit,
  ) async {
    final _repo = state.repo!;
    emit(const _Loading());
    try {
      final repo = await repoRepository.updateRepo(
        repo: _repo,
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(_Success(repo: repo));
    } on DroneException catch (e) {
      emit(_Failure(message: e.message));
    } catch (e) {
      emit(_Failure(message: e.toString()));
    }
  }

  void _onDisablePullRequestClicked(
    _DisablePullRequestClicked event,
    Emitter<RepoSettingsState> emit,
  ) {
    final _repo = state.repo!;
    emit(
      _Success(
        repo: _repo.copyWith(ignorePullRequests: !_repo.ignorePullRequests),
      ),
    );
  }

  void _onDisableForksClicked(
    _DisableForksClicked event,
    Emitter<RepoSettingsState> emit,
  ) {
    final _repo = state.repo!;
    emit(
      _Success(repo: _repo.copyWith(ignoreForks: !_repo.ignoreForks)),
    );
  }

  void _onChangeProtectedClicked(
    _ChangeProtectedClicked event,
    Emitter<RepoSettingsState> emit,
  ) {
    final _repo = state.repo!;
    emit(
      _Success(repo: _repo.copyWith(protected: !_repo.protected)),
    );
  }

  void _onChangeTrustedClicked(
    _ChangeTrustedClicked event,
    Emitter<RepoSettingsState> emit,
  ) {
    final _repo = state.repo!;
    emit(
      _Success(repo: _repo.copyWith(trusted: !_repo.trusted)),
    );
  }

  void _onChangeAutoCancelPullRequestsClicked(
    _ChangeAutoCancelPullRequestsClicked event,
    Emitter<RepoSettingsState> emit,
  ) {
    final _repo = state.repo!;
    emit(
      _Success(
        repo: _repo.copyWith(
          autoCancelPullRequests: !_repo.autoCancelPullRequests,
        ),
      ),
    );
  }

  void _onChangeAutoCancelPushesClicked(
    _ChangeAutoCancelPushesClicked event,
    Emitter<RepoSettingsState> emit,
  ) {
    final _repo = state.repo!;
    emit(
      _Success(repo: _repo.copyWith(autoCancelPushes: !_repo.autoCancelPushes)),
    );
  }

  void _onChangeVisibilityClicked(
    _ChangeVisibilityClicked event,
    Emitter<RepoSettingsState> emit,
  ) {
    final _repo = state.repo!;
    emit(
      _Success(repo: _repo.copyWith(visibility: event.visibility)),
    );
  }

  void _onConfigPathChanged(
    _ConfigPathChanged event,
    Emitter<RepoSettingsState> emit,
  ) {
    final _repo = state.repo!;
    emit(
      _Success(repo: _repo.copyWith(configPath: event.value)),
    );
  }

  void _onChangeTimeout(
    _ChangeTimeout event,
    Emitter<RepoSettingsState> emit,
  ) {
    final _repo = state.repo!;
    emit(
      _Success(repo: _repo.copyWith(timeout: event.timeout.value)),
    );
  }
}
