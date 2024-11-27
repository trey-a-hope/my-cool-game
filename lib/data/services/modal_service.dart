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
        builder: (c) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'YES',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                'NO',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
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
        closeButtonShowType: CloseButtonShowType.none,
      );
}
