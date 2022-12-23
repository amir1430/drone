import 'dart:async';

import 'package:drone/core/core.dart';
import 'package:drone/features/app/app.dart';
import 'package:drone/features/build/build.dart';
import 'package:drone/features/home/home.dart';
import 'package:drone/features/login/login.dart';
import 'package:drone/features/repo/repo.dart';
import 'package:drone/features/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

class AppRouter {
  static GoRouter router({
    required AppBloc appBloc,
  }) {
    return GoRouter(
      // debugLogDiagnostics: true,
      initialLocation: SplashRoute().location,
      refreshListenable: _GoRouterRefreshStream(appBloc.stream),
      redirect: (context, state) {
        final _isGoingToLogin = state.subloc == LoginRoute().location;
        final _isInSplash = state.subloc == SplashRoute().location;

        return appBloc.state.when(
          unknown: () => null,
          authenticated: (_, __) =>
              _isGoingToLogin || _isInSplash ? HomeRoute().location : null,
          unAuthenticated: () => _isGoingToLogin ? null : LoginRoute().location,
        );
      },
      routes: $appRoutes,
    );
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<RepoRoute>(
      path: 'repo/:owner/:repoName',
      routes: [
        TypedGoRoute<BuildRotue>(
          path: 'build/:number',
          routes: [
            TypedGoRoute<LogRoute>(path: 'log'),
          ],
        ),
      ],
    ),
    TypedGoRoute<SettingsRoute>(path: 'settings'),
  ],
)
class HomeRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _PageBuilder.builder(
      key: state.pageKey,
      child: BlocProvider(
        create: (context) => HomeBloc(
          authRepository: context.read(),
          repoRepository: context.read()..init(),
        ),
        child: const HomeView(),
      ),
    );
  }
}

class SettingsRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _PageBuilder.builder(
      key: state.pageKey,
      child: const SettingView(),
    );
  }
}

class RepoRoute extends GoRouteData {
  const RepoRoute({
    required this.owner,
    required this.repoName,
  });

  final String owner;
  final String repoName;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _PageBuilder.builder(
      key: state.pageKey,
      child: RepoView(owner: owner, repoName: repoName),
    );
  }
}

class BuildRotue extends GoRouteData {
  const BuildRotue({
    required this.owner,
    required this.repoName,
    required this.number,
  });

  final String owner;
  final String repoName;
  final int number;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _PageBuilder.builder(
      key: state.pageKey,
      child: BuildView(name: repoName, owner: owner, number: number),
    );
  }
}

class LogRoute extends GoRouteData {
  const LogRoute({
    required this.owner,
    required this.repoName,
    required this.number,
    this.stageName,
    this.stageNum,
    this.stepName,
    this.stepNum,
  });

  final String owner;
  final String repoName;
  final int number;
  final String? stageName;
  final String? stageNum;
  final String? stepName;
  final String? stepNum;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _PageBuilder.builder(
      key: state.pageKey,
      child: BuildLogDialog(
        owner: owner,
        name: repoName,
        number: number,
        stageNum: stageNum!,
        stepNum: stepNum!,
        stageName: stageName!,
        stepName: stepName!,
      ),
    );
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _PageBuilder.builder(key: state.pageKey, child: const LoginView());
  }
}

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _PageBuilder.builder(
      key: state.pageKey,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator.adaptive(),
              SizedBox(height: 24),
              Text('Drone'),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    _streamSubscription = stream.listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _streamSubscription;
  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}

abstract class _PageBuilder {
  static Page<void> builder({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      // transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
