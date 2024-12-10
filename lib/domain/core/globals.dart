import 'package:bonfire/bonfire.dart' as bonfire;
import 'package:flutter/material.dart';

class Globals {
  Globals._();

  static final forces = _Forces();
  static final imageAssets = _ImageAssets();
  static final input = _Input();
  static final lottie = _Lottie();

  static const spriteStepTime = 0.1;
  static const tileSize = 32.0;
}

class _Forces {
  final gravity = bonfire.AccelerationForce2D(
    id: 'gravity',
    value: bonfire.Vector2(0, 400),
  );
}

class _ImageAssets {
  static const _images = 'assets/images/';

  final dwarf = Image.asset(
    '${_images}dwarf_warrior/idle/0.png',
    scale: 0.3,
  );

  final alchemist = Image.asset(
    '${_images}alchemist/0.png',
    scale: 0.5,
  );

  final blacksmith = Image.asset(
    '${_images}blacksmith/0.png',
    scale: 0.5,
  );

  final charcoalText = const TextSpan(
    text: 'charcoal',
    style: TextStyle(
      color: Colors.grey,
    ),
  );

  final elixerText = const TextSpan(
    text: 'elixer',
    style: TextStyle(
      color: Colors.green,
    ),
  );
}

class _Input {
  static const path = 'input/';

  final aPressed = '${path}a_pressed.png';
  final aUnpressed = '${path}a_unpressed.png';
  final bPressed = '${path}b_pressed.png';
  final bUnpressed = '${path}b_unpressed.png';
  final xPressed = '${path}x_pressed.png';
  final xUnpressed = '${path}x_unpressed.png';
  final yPressed = '${path}y_pressed.png';
  final yUnpressed = '${path}y_unpressed.png';
  final leftJoystick = '${path}left_joystick.png';
}

class _Lottie {
  final gameOver = 'assets/lotties/game_over.json';
  final gameWon = 'assets/lotties/game_won.json';
}
