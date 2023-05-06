import 'package:flutter/material.dart';

class SquareBtn extends Material {
  SquareBtn({
    super.key,
    required Widget child,
    required VoidCallback onPressed,
    Size size = const Size(50, 50),
  }) : super(
          clipBehavior: Clip.antiAlias,
          elevation: 1,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: onPressed,
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: child,
            ),
          ),
        );
}
