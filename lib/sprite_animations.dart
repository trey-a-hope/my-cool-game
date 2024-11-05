import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/globals.dart';

class SpriteAnimations {
  SpriteAnimations._();

  static final alchemist = _Alchemist();
  static final blacksmith = _Blacksmith();
  static final dwarfWarrior = _DwarfWarrior();
}

class _Alchemist {
  Future<SpriteAnimation> get idle async => _spriteAnimation(
        count: 8,
        path: 'alchemist',
      );
}

class _Blacksmith {
  Future<SpriteAnimation> get idle async => _spriteAnimation(
        count: 7,
        path: 'blacksmith',
      );
}

class _DwarfWarrior {
  Future<SpriteAnimation> get idle async => _spriteAnimation(
        count: 3,
        path: 'dwarf_warrior/idle',
      );

  Future<SpriteAnimation> get walk async => _spriteAnimation(
        count: 6,
        path: 'dwarf_warrior/walk',
      );
}

Future<SpriteAnimation> _spriteAnimation({
  required int count,
  required String path,
}) async {
  final sprites = <Sprite>[];

  for (int i = 0; i < count; i++) {
    final sprite = await Sprite.load('$path/$i.png');
    sprites.add(sprite);
  }

  return SpriteAnimation.spriteList(
    sprites,
    stepTime: Globals.spriteStepTime,
  );
}
