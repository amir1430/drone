import 'package:flutter/material.dart';

class IconBtn extends Tooltip {
  IconBtn({
    super.key,
    required VoidCallback? onPressed,
    IconData? icon,
    String toolTip = 'tooltip',
    Color? color,
    Widget? child,
    double? size,
  })  : assert(child == null || icon == null, ''),
        super(
          message: toolTip,
          child: IconButton(
            onPressed: onPressed,
            icon: child ??
                Icon(
                  icon,
                  color: color,
                  size: size,
                ),
          ),
        );
}
