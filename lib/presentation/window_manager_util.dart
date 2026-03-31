import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:window_manager/window_manager.dart';

const _windowMinimumSize = Size(1200, 800);

class WindowManagerUtil {
  static Future<void> init() async {
    if (!UniversalPlatform.isDesktop) {
      return;
    }

    await windowManager.ensureInitialized();

    const windowOptions = WindowOptions(
      size: _windowMinimumSize,
      minimumSize: _windowMinimumSize,
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      // await windowManager.maximize();
    });
  }
}
