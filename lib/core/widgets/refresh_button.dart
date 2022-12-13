import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    super.key,
    this.lable = 'Retry',
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(lable),
      icon: const Icon(
        Ionicons.reload,
        // color: context.secondaryColor,
      ),
    );
  }
}
