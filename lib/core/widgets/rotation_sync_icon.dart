import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RotationSyncIcon extends HookWidget {
  const RotationSyncIcon({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(
        seconds: 1,
      ),
    )
      ..forward()
      ..repeat();

    final tween = useMemoized(
      () {
        return Tween<double>(end: 0, begin: pi * 2);
      },
    );
    final animation = useAnimation(tween.animate(animationController));

    return Transform.rotate(
      angle: animation,
      child: Icon(
        Icons.sync_outlined,
        color: color,
      ),
    );
  }
}
