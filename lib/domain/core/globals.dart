import 'package:bonfire/bonfire.dart';

class Globals {
  Globals._();

  static final audio = _Audio();
  static final fonts = _Fonts();
  static final forces = _Forces();
  static final input = _Input();
  static final lottie = _Lottie();
  static final map = _Map();

  static const spriteStepTime = 0.1;
  static const tileSize = 32.0;
}

class _Audio {
  final backgroundMusic = 'background_music.mp3';
  // TODO: chestOpen
  final collectItem = 'collect_item.wav';
  // TODO: dwarfWarriorAttack
  // TODO: dwarfWarriorDie
  final dwarfWarriorHurt = 'dwarf_warrior_hurt.wav';
  final flame = 'flame.wav';
  final gem = 'gem.flac';
  // TODO: gameOver
  // TODO: gameWon
  final headlessHorsemanAttack = 'headless_horseman_attack.wav';
  // TODO: headlessHorsemanDie
  // TODO: headlessHorsemanHurt
  final lizardManAttack = 'lizard_man_attack.wav';
  final lizardManDie = 'lizard_man_die.wav';
  // TODO: lizardManHurt
  final minotaurAttack = 'minotaur_attack.wav';
  // TODO: minotaurDie
  // TODO: minotaurHurt
  final potion = 'potion.wav';
}

class _Fonts {
  final adventure = 'adventure';
}

class _Forces {
  final gravity = AccelerationForce2D(
    id: 'gravity',
    value: Vector2(0, 400),
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

class _Map {
  final name = 'map.json';
}
