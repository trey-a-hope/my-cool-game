import 'package:bonfire/bonfire.dart' as bonfire;
import 'package:flutter/material.dart';

class Globals {
  Globals._();

  static final audio = _Audio();
  static final fonts = _Fonts();
  static final forces = _Forces();
  static final imageAssets = _ImageAssets();
  static final input = _Input();
  static final lottie = _Lottie();

  static const spriteStepTime = 0.1;
  static const tileSize = 32.0;
  static const deltaThreshold = 0.05;
}

class _Audio {
  final backgroundMusic = 'background_music.mp3';
  final chestOpening = 'chest_opening.wav';
  final collectItem = 'collect_item.wav';
  final dwarfWarriorAttack = 'dwarf_warrior_attack.mp3';
  final dwarfWarriorDie = 'dwarf_warrior_die.wav';
  final dwarfWarriorHurt = 'dwarf_warrior_hurt.wav';
  final flame = 'flame.wav';
  final gem = 'gem.flac';
  final gameOver = 'game_over.wav';
  final gameWon = 'game_won.wav';
  final headlessHorsemanAttack = 'headless_horseman_attack.wav';
  final headlessHorsemanDie = 'headless_horseman_die.wav';
  final headlessHorsemanHurt = 'headless_horseman_hurt.wav';
  final lizardManAttack = 'lizard_man_attack.wav';
  final lizardManDie = 'lizard_man_die.wav';
  final lizardManHurt = 'lizard_man_hurt.mp3';
  final minotaurAttack = 'minotaur_attack.wav';
  final minotaurDie = 'minotaur_die.wav';
  final minotaurHurt = 'minotaur_hurt.wav';
  final potion = 'potion.wav';
}

class _Fonts {
  final adventure = 'adventure';
}

class _Forces {
  final playerGravity = bonfire.AccelerationForce2D(
    id: 'gravity',
    value: bonfire.Vector2(0, 400),
  );

  final enemyGravity = bonfire.AccelerationForce2D(
    id: 'enemy_gravity',
    value: bonfire.Vector2(0, 4000),
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
