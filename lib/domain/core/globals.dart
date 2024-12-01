import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/domain/entities/enemies/headless_horseman.dart';
import 'package:my_cool_game/domain/entities/enemies/lizardman.dart';
import 'package:my_cool_game/domain/entities/enemies/minotaur.dart';
import 'package:my_cool_game/domain/entities/npcs/alchemist.dart';
import 'package:my_cool_game/domain/entities/npcs/blacksmith.dart';
import 'package:my_cool_game/domain/entities/objects/bonfire.dart';
import 'package:my_cool_game/domain/entities/objects/chest.dart';
import 'package:my_cool_game/domain/entities/objects/plant.dart';
import 'package:my_cool_game/domain/entities/objects/world_object.dart';

class Globals {
  Globals._();

  static final forces = _Forces();
  static final input = _Input();
  static final map = _Map();

  static const spriteStepTime = 0.1;
  static const tileSize = 32.0;
}

class _Map {
  final name = 'map.json';

  final objectsBuilder = {
    'Alchemist': (properties) => Alchemist(
          position: properties,
        ),
    'Blacksmith': (properties) => Blacksmith(
          position: properties,
        ),
    'Bonfire': (properties) => Bonfire(
          position: properties,
        ),
    'Chest': (properties) => Chest(
          position: properties,
        ),
    'Headless Horseman': (properties) => HeadlessHorseman(
          position: properties,
        ),
    'Lizardman': (properties) => Lizardman(
          position: properties,
        ),
    'Minotaur': (properties) => Minotaur(
          position: properties,
        ),
    'Plant': (properties) => Plant(
          position: properties,
        ),
    'World Object': (properties) => WorldObject(
          position: properties,
        ),
  };
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

class _Forces {
  final gravity = AccelerationForce2D(
    id: 'gravity',
    value: Vector2(0, 400),
  );
}
