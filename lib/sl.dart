import 'package:auth_repository/auth_repository.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:drone/features/app/app.dart';
import 'package:drone/features/branches/bloc/branches_bloc.dart';
import 'package:drone/features/build/bloc/bloc.dart';
import 'package:drone/features/build/bloc/build_log_bloc/build_log_bloc.dart';
import 'package:drone/features/builds/bloc/builds_bloc.dart';
import 'package:drone/features/deployments/bloc/deployments_bloc.dart';
import 'package:drone/features/home/bloc/home_bloc.dart';
import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:drone/features/repo_settings/bloc/repo_setting_bloc.dart';
import 'package:drone/features/setting/bloc/setting_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:repo_repository/repo_repository.dart';

final sl = GetIt.instance;

Future<void> initSl() async {
  sl
    ..registerFactory<AppBloc>(
      () => AppBloc(
        authRepository: sl(),
        notificationRepository: sl(),
      ),
    )
    ..registerFactory<HomeBloc>(
      () => HomeBloc(
        authRepository: sl(),
        repoRepository: sl(),
      ),
    )
    ..registerFactory<RepoSettingsBloc>(
      () => RepoSettingsBloc(
        repoRepository: sl(),
      ),
    )
    ..registerFactory<BuildsBloc>(
      () => BuildsBloc(
        repoRepository: sl(),
      ),
    )
    ..registerFactory<BranchesBloc>(
      () => BranchesBloc(
        repoRepository: sl(),
      ),
    )
    ..registerFactory<DeploymentsBloc>(
      () => DeploymentsBloc(
        repoRepository: sl(),
      ),
    )
    ..registerFactoryParam<BuildLogBloc, BuildLogBlocParams, void>(
      (params, _) => BuildLogBloc(repoRepository: sl(), params: params),
    )
    ..registerFactory<BuildBloc>(
      () => BuildBloc(
        repository: sl(),
      ),
    )
    ..registerFactory<SettingBloc>(
      () => SettingBloc(
        authRepository: sl(),
      ),
    )
    ..registerFactory<LoginCubit>(
      () => LoginCubit(
        authRepository: sl(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepository(dataSource: sl()),
    )
    ..registerLazySingleton<RepoRepository>(
      () => RepoRepository(userLocalDataSource: sl()),
    )
    ..registerLazySingleton<NotificationRepository>(
      () {
        final awesomeNotifications = AwesomeNotifications();

        final instance = NotificationRepository(
          userLocalDataSource: sl(),
          awesomeNotifications: awesomeNotifications,
        );

        awesomeNotifications.setListeners(
          onActionReceivedMethod: NotificationRepository.onActionReceivedMethod,
        );

        return instance;
      },
    )
    ..registerLazySingleton<UserLocalDataSource>(
      () {
        return HiveUserLocalDataSource(userBox: sl());
      },
    )
    ..registerSingleton<Box<User>>(
      Hive.box<User>('users_box'),
    );
}
