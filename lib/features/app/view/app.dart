import 'package:auth_repository/auth_repository.dart';
import 'package:drone/features/app/app.dart';
import 'package:drone/features/app/router.dart';
import 'package:drone/features/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:repo_repository/repo_repository.dart';

class App extends HookWidget {
  const App({
    super.key,
    required this.userBox,
  });

  final Box<User> userBox;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserLocalDataSource>(
          create: (_) => HiveUserLocalDataSource(
            userBox: userBox,
          ),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) =>
              AuthRepository(dataSource: context.read<UserLocalDataSource>()),
        ),
        RepositoryProvider<RepoRepository>(
          create: (context) => RepoRepository(
            userLocalDataSource: context.read<UserLocalDataSource>(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (context) =>
                AppBloc(authRepository: context.read<AuthRepository>())
                  ..add(const AppEvent.started()),
          ),
        ],
        child: const _App(),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.router(
      appBloc: context.read<AppBloc>(),
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'drone app',
      routerConfig: router,
      theme: AppTheme.theme,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            overscroll: false,
            physics: const BouncingScrollPhysics(),
          ),
          child: SafeArea(child: child!),
        );
      },
    );
  }
}
