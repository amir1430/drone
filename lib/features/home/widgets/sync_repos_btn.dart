import 'dart:math';

import 'package:drone/core/core.dart';
import 'package:drone/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

class SyncReposBtn extends HookWidget {
  const SyncReposBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(seconds: 1));

    final circleTween = useMemoized(
      () => Tween<double>(begin: 0, end: 2 * pi),
    );

    final animation = circleTween.animate(animationController);
    final angle = useAnimation(animation);

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.syncStatus == HomeStatus.loading) {
          animationController.forward();
        } else {
          animationController.reset();
        }
      },
      builder: (context, state) {
        return IconBtn(
          toolTip: 'Sync',
          onPressed: () =>
              context.read<HomeBloc>().add(const HomeEvent.syncRepos()),
          child: Transform.rotate(
            angle: angle,
            child:  Icon(
              Ionicons.sync,
              color: Colors.blue.shade800,
            ),
          ),
        );
      },
    );
  }
}
