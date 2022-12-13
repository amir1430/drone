import 'package:drone/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DroneBackBtn extends StatelessWidget {
  const DroneBackBtn({
    super.key,
    this.color,
    this.icon,
    this.onPressed,
  });

  final Color? color;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconBtn(
      toolTip: 'back',
      onPressed: onPressed ??
          () {
            if (context.canPop()) {
              context.pop();
            }
          },
      icon: icon ?? Icons.arrow_back_ios,
      color: color,
      size: 16,
    );
  }
}
