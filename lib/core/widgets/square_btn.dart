import 'package:flutter/material.dart';

// class SquareBtn extends TextButton {
//   SquareBtn({
//     Key? key,
//     required VoidCallback? onPressed,
//     Widget child = const SizedBox.shrink(),
//     double dimension = 50,
//   }) : super(
//           key: key,
//           onPressed: onPressed,
//           child: child,
//           style: TextButton.styleFrom(
//               fixedSize: Size.square(dimension),
//               padding: const EdgeInsets.all(0)),
//         );
// }

class SquareBtn extends Material {
  SquareBtn({
    super.key,
    required Widget child,
    required VoidCallback onPressed,
    Size size = const Size(50, 50),
  }) : super(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
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
