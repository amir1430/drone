part of 'home_bloc.dart';

enum DrawerFilter { all, activeOnly, deactiveOnly }

enum HomeStatus { initial, loading, success, failure }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default(HomeStatus.initial) HomeStatus syncStatus,
    @Default(DrawerFilter.all) DrawerFilter filter,
    @Default([]) List<DroneRepo> repos,
    @Default([]) List<DroneRepo> homeRepos,
    @Default([]) List<DroneRepo> drawerRepos,
    String? failureMessage,
  }) = _HomeState;
}

extension LoadedX on List<DroneRepo> {
  List<DroneRepo> get reposWithBuild => [...where((repo) => repo.build != null)]
    ..sort((a, b) => b.build!.started.compareTo(a.build!.started));

  List<DroneRepo> get activeRepos => [...where((repo) => repo.active)]
    ..sort((a, b) => b.name.compareTo(a.name));

  List<DroneRepo> get deactiveRepos => [...where((repo) => !repo.active)]
    ..sort((a, b) => b.name.compareTo(a.name));

  List<DroneRepo> drawerFilter(DrawerFilter filter) => [
        if (filter == DrawerFilter.all) ...this,
        if (filter == DrawerFilter.activeOnly) ...activeRepos,
        if (filter == DrawerFilter.deactiveOnly) ...deactiveRepos,
      ];
}
