import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'deployments_event.dart';
part 'deployments_state.dart';
part 'deployments_bloc.freezed.dart';

class DeploymentsBloc extends Bloc<DeploymentsEvent, DeploymentsState> {
  DeploymentsBloc({required this.repoRepository}) : super(const _Initial()) {
    on<_Started>(_onStarted);
  }

  final RepoRepository repoRepository;

  Future<void> _onStarted(
    _Started event,
    Emitter<DeploymentsState> emit,
  ) async {
    emit(const _Loading());
    try {
      final deployments = await repoRepository.getRepoDeployments(
        owner: event.owner,
        repoName: event.repoName,
      );
      emit(_Success(deployments: deployments));
    } on DroneException catch (e) {
      emit(_Failure(message: e.message));
    } catch (e) {
      emit(_Failure(message: e.toString()));
    }
  }
}
