import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

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

    final _tween = useMemoized(
      () {
        return Tween<double>(begin: 0, end: pi * 2);
      },
    );
    final animation = useAnimation(_tween.animate(animationController));

    return Transform.rotate(
      angle: animation,
      child: Icon(
        Ionicons.sync_circle_outline,
        color: color,
      ),
    );
  }
}
