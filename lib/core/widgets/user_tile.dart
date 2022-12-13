import 'package:flutter/material.dart';

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({
    super.key,
    required this.child,
    this.size = const Size.square(50),
    this.onTap,
    this.side = BorderSide.none,
    this.elevation = 0.0,
    this.shape,
  });

  final VoidCallback? onTap;
  final BorderSide side;
  final Widget child;
  final double elevation;
  final Size size;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: side,
            ),
        elevation: elevation,
        shadowColor: Theme.of(context).colorScheme.primary.withOpacity(.25),
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
