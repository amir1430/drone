import 'dart:async';

import 'package:drone_dart/drone_dart.dart';
import 'package:local_data_source/local_data_sorce.dart';
import 'package:rxdart/rxdart.dart';

class RepoRepository {
  RepoRepository({
    required UserLocalDataSource userLocalDataSource,
  }) : _userLocalDataSource = userLocalDataSource;

  final UserLocalDataSource _userLocalDataSource;

  late StreamSubscription<User?>? _currentUserStreamSubscription;
  late StreamSubscription<List<User>>? _usersStreamSubscription;
  late StreamSubscription<DroneEvent>? _newRepoEventsubscription;

  late StreamController<DroneEvent?> _newRepoEventcontroller;

  late DroneClient _client;

  Future<void> init() async {
    _newRepoEventcontroller = BehaviorSubject();

    _currentUserStreamSubscription =
        _userLocalDataSource.currentUserStream.listen((currentUser) {

      if (currentUser != null) {
        _client = currentUser.client;

        _newRepoEventsubscription = _client.stream.listen(
          _newRepoEventcontroller.sink.add,
        );
      }
    });

    _usersStreamSubscription =
        _userLocalDataSource.usersStream.listen((users) {});
  }

  Future<void> close() async {
    await _newRepoEventcontroller.close();

    await _newRepoEventsubscription?.cancel();
    await _usersStreamSubscription?.cancel();
    await _currentUserStreamSubscription?.cancel();
  }

  Stream<DroneEvent?> get newRepoEvent => _newRepoEventcontroller.stream;

  Stream<DroneLogEvent> logStream({
    required int build,
    required String stage,
    required String step,
    required String owner,
    required String repoName,
  }) {
    return _client.logStream(
        repoName: repoName,
        stage: stage,
        step: step,
        nameSpace: owner,
        build: '$build');
  }

  Future<List<DroneRepo>> getAllRepos() => _fetch(_client.userSection.repos());

  Future<List<DroneRepo>> syncRepos() => _fetch(_client.userSection.sync());

  Future<DroneRepo> enableRepo({
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.repoSection.enable(owner: owner, name: repoName));

  Future<DroneRepo> disableRepo({
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.repoSection.disable(owner: owner, repo: repoName));

  Future<DroneRepo> updateRepo({
    required DroneRepo repo,
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.repoSection
          .update(owner: owner, repo: repoName, droneRepo: repo));

  Future<DroneRepo> getRepoSetting({
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.repoSection.info(owner: owner, repo: repoName));

  Future<List<DroneBuild>> getRepoBranches({
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.buildSection.branches(owner: owner, repo: repoName));

  Future<List<DroneBuild>> getRepoDeployments({
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.buildSection.deployments(owner: owner, repo: repoName));

  Future<List<DroneBuild>> getRepoBuilds({
    int page = 1,
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.buildSection
          .list(owner: owner, repo: repoName, page: page, perPage: 25));

  Future<DroneBuild> newBuild({
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.buildSection.create(namespace: owner, name: repoName));

  Future<DroneBuild> getRepoBuildInfo({
    required int build,
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.buildSection
          .info(owner: owner, build: build, repo: repoName));

  Future<List<DroneLog>> getRepoBuildLogInfo({
    required int build,
    required String stage,
    required String step,
    required String owner,
    required String repoName,
  }) =>
      _fetch(_client.buildSection.log(
        owner: owner,
        repo: repoName,
        build: build,
        stage: stage,
        step: step,
      ));

  Future<T> _fetch<T>(Future<T> future) async {
    try {
      return await future;
    } catch (_) {
      rethrow;
    }
  }
}
