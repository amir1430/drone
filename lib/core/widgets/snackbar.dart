import 'package:drone/core/core.dart';
import 'package:flutter/material.dart';

class DroneSnackbar extends SnackBar {
  DroneSnackbar({
    required String message,
    super.key,
    Color? color,
  }) : super(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: color,
          elevation: 4,
          // action: SnackBarAction(label: 'label', onPressed: () {}),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
}

void showDroneSnackbar(
  BuildContext context, {
  required String message,
  bool? isError,
}) {
  context.scaffoldMessenger.hideCurrentSnackBar();
  context.scaffoldMessenger.showSnackBar(
    DroneSnackbar(
      message: message,
      color: isError != null && isError == true
          ? Colors.red
          : context.colorScheme.primary,
    ),
  );
}
