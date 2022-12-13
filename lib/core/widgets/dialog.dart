import 'package:drone/core/core.dart';
import 'package:flutter/material.dart';

void showAlertDialog(
  BuildContext context, {
  required String title,
  String acceptText = 'Accept',
  String cancelText = 'Cancel',
  required VoidCallback onAccept,
}) {
  showDialog<AlertDialog>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: context.headline3,
        ),
        actions: [
          OverflowBar(
            overflowAlignment: OverflowBarAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  cancelText,
                  style: context.headline5,
                ),
              ),
              TextButton(
                onPressed: () {
                  onAccept();
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(),
                child: Text(
                  acceptText,
                  style:
                      context.headline5?.copyWith(color: context.primaryColor),
                ),
              )
            ],
          )
        ],
      );
    },
  );
}
