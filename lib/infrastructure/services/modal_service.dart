import 'package:flutter/widgets.dart';
import 'package:toastification/toastification.dart';

class ModalService {
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
