import 'package:drone/features/app/app.dart';
import 'package:drone/features/app/router.dart';
import 'package:drone/features/app/theme.dart';
import 'package:drone/sl.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => sl()..add(const AppEvent.started()),
        ),
      ],
      child: const _App(),
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
        return BlocListener<AppBloc, AppState>(
          listenWhen: (previous, current) {
            final previousPath = previous.whenOrNull(
              authenticated: (_, __, deferredPath) {
                return deferredPath;
              },
            );
            final currentPath = current.whenOrNull(
              authenticated: (_, __, deferredPath) {
                return deferredPath;
              },
            );

            return previousPath != currentPath;
          },
          listener: (context, state) {
            // state.whenOrNull(
            //   authenticated: (users, currentUser, deferredPath) {
            //     if (deferredPath != null) {
            //       context.push(deferredPath);
            //     }
            //   },
            // );
          },
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              overscroll: false,
              physics: const BouncingScrollPhysics(),
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: SafeArea(child: child!),
          ),
        );
      },
    );
  }
}
