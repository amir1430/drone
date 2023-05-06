import 'package:drone/core/core.dart';
import 'package:flutter/material.dart';
import 'package:repo_repository/repo_repository.dart';

class DroneErrorWidget extends StatelessWidget {
  const DroneErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
    this.retryText = 'Retry',
    this.style,
    this.btnStyle,
  });

  final Object message;
  final String retryText;
  final VoidCallback onRetry;
  final TextStyle? style;
  final ButtonStyle? btnStyle;

  @override
  Widget build(BuildContext context) {
    late final String message;
    if (this.message is DroneException) {
      message = (this.message as DroneException).message;
    } else {
      message = '${this.message}';
    }
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              maxLines: 3,
              style: style ?? context.headline5,
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: onRetry,
              style: btnStyle,
              child: Text(retryText),
            ),
          ],
        ),
      ),
    );
  }
}
