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

class AppRouter {
  static GoRouter router({
    required AppBloc appBloc,
  }) {
    return GoRouter(
      // debugLogDiagnostics: true,
      initialLocation: '/splash',
      refreshListenable: _GoRouterRefreshStream(appBloc.stream),
      redirect: (context, state) {
        final _isGoingToLogin = state.subloc == '/login';
        final _isInSplash = state.subloc == '/splash';

        return appBloc.state.when(
          unknown: () => null,
          authenticated: (_, __) => _isGoingToLogin || _isInSplash ? '/' : null,
          unAuthenticated: () => _isGoingToLogin ? null : '/login',
        );
      },
      routes: [
        _AppRoute(
          path: '/',
          name: 'home',
          childBuilder: (_, __) {
            return BlocProvider(
              create: (context) => HomeBloc(
                authRepository: context.read(),
                repoRepository: context.read(),
              ),
              child: const HomeView(),
            );
          },
          routes: [
            _AppRoute(
              path: 'settings',
              name: 'settings',
              childBuilder: (_, __) => const SettingView(),
            ),
            _AppRoute(
              path: 'repo/:owner/:repo_name',
              name: 'repo',
              childBuilder: (context, state) {
                // final appState = appBloc.state;
                // final repo = state.extra! as DroneRepo;
                final owner = state.params['owner']!;
                final repoName = state.params['repo_name']!;
                return RepoView(owner: owner, repoName: repoName);
              },
              routes: [
                _AppRoute(
                  path: 'build/:number',
                  name: 'build',
                  childBuilder: (context, state) {
                    final owner = state.params['owner']!;
                    final repoName = state.params['repo_name']!;
                    final number = state.params['number']!;

                    // final appState = appBloc.state;
                    return BuildView(
                      name: repoName,
                      owner: owner,
                      number: int.parse(number),
                    );
                  },
                  routes: [
                    _AppRoute(
                      path: 'log',
                      name: 'log',
                      childBuilder: (context, state) {
                        final owner = state.params['owner']!;
                        final name = state.params['repo_name']!;
                        final number = state.params['number']!;

                        final stageNum = state.queryParams['stage_num']!;
                        final stepNum = state.queryParams['step_num']!;

                        final stageName = state.queryParams['stage_name']!;
                        final stepName = state.queryParams['step_name']!;

                        // final appSate = appBloc.state;

                        return BuildLogDialog(
                          owner: owner,
                          name: name,
                          number: int.parse(number),
                          stageNum: stageNum,
                          stepNum: stepNum,
                          stageName: stageName,
                          stepName: stepName,
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        _AppRoute(
          path: '/login',
          name: 'login',
          childBuilder: (_, __) => const LoginView(),
        ),
        _AppRoute(
          path: '/splash',
          name: 'splash',
          childBuilder: (context, __) {
            return Scaffold(
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
            );
          },
        ),
      ],
    );
  }
}

class _AppRoute extends GoRoute {
  _AppRoute({
    required super.path,
    required super.name,
    super.routes,
    required this.childBuilder,
  }) : super(
          pageBuilder: (context, state) => _pageBuilder(
            key: state.pageKey,
            child: childBuilder(context, state),
          ),
        );

  final Widget Function(BuildContext context, GoRouterState state) childBuilder;

  static Page<void> _pageBuilder({
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

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<AppState> stream) {
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
