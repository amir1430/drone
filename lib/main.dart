import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:drone/core/constants.dart';
import 'package:drone/features/app/app.dart';
import 'package:drone/sl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:repo_repository/repo_repository.dart';

Future<void> main() async {
  DroneClient.log = true;

  Bloc.observer = AppBlocObserver();
  await runZonedGuarded(
    () async {
      // Hive
      await Hive.initFlutter();
      Hive.registerAdapter(HiveUserAdapter());
      await Hive.openBox<User>('users_box');

      // Awesome notifications
      await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: AppConstants.channelKey,
            channelName: AppConstants.channelName,
            channelDescription: 'Notification channel for basic tests',
          ),
        ],
        debug: true,
      );

      await initSl();
      // await sl.allReady();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // setup app status bar color
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Color(0xffe8e8e8),
          statusBarIconBrightness: Brightness.dark,
        ),
      );

      runApp(const App());
    },
    (_, __) {},
  );
}
