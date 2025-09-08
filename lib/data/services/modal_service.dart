import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ModalService {
  static Future<bool?> showConfirmation({
    required String title,
    required String message,
    required BuildContext context,
  }) async =>
      await showDialog<bool>(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              _confirmationAction('YES', true, context),
              _confirmationAction('NO', false, context),
            ],
          );
        },
      );

  static void showToast({
    required String title,
    required ToastificationType type,
    Widget? icon,
  }) =>
      Toastification().show(
        title: Text(title),
        type: type,
        icon: icon,
        autoCloseDuration: const Duration(
          seconds: 3,
        ),
        showProgressBar: false,
      );

  static TextButton _confirmationAction(
    String s,
    bool b,
    BuildContext c,
  ) =>
      TextButton(
        onPressed: () => Navigator.of(c).pop(b),
        child: Text(
          s,
          style: const TextStyle(color: Colors.black),
        ),
      );
}
