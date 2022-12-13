import 'dart:async';

import 'package:drone_dart/drone_dart.dart';

class RepoRepository {
  RepoRepository();

  late DroneClient _client;
  set client(DroneClient c) => _client = c;
  DroneClient get clinet => _client;

  Future<List<DroneRepo>> getAllRepos() => _fetch(_client.userSection.repos());

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
