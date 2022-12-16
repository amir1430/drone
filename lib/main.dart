import 'dart:async';

import 'package:drone/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_data_source/local_data_sorce.dart';
import 'package:repo_repository/repo_repository.dart';

Future<void> main() async {
  DroneClient.log = true;

  Bloc.observer = AppBlocObserver();
  await runZonedGuarded(
    () async {
      // Hive
      await Hive.initFlutter();
      Hive.registerAdapter(HiveUserAdapter());
      final usersBox = await Hive.openBox<User>('users_box');

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

      runApp(
        App(
          userBox: usersBox,
        ),
      );
    },
    (_, __) {},
  );
}
