import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/domain/core/globals.dart';

class SpriteAnimations {
  SpriteAnimations._();

  static final alchemist = _Alchemist();
  static final blacksmith = _Blacksmith();
  static final bonfire = _Bonfire();
  static final chest = _Chest();
  static final dwarfWarrior = _DwarfWarrior();
  static final headlessHorseman = _HeadlessHorseman();
  static final lizardman = _Lizardman();
  static final minotaur = _Minotaur();
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

class _Bonfire {
  Future<SpriteAnimation> get idle async => _spriteAnimation(
        count: 6,
        path: 'bonfire',
      );
}

class _Chest {
  Future<SpriteAnimation> get closed async => SpriteAnimation.spriteList(
        [
          await Sprite.load('chest/0.png'),
        ],
        stepTime: Globals.spriteStepTime,
      );

  Future<SpriteAnimation> get opening async => _spriteAnimation(
        count: 10,
        path: 'chest',
      );

  Future<SpriteAnimation> get open async => SpriteAnimation.spriteList(
        [
          await Sprite.load('chest/9.png'),
        ],
        stepTime: Globals.spriteStepTime,
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

  Future<SpriteAnimation> get attack async => _spriteAnimation(
        count: 6,
        path: 'dwarf_warrior/attack',
      );

  Future<SpriteAnimation> get hurt async => _spriteAnimation(
        count: 3,
        path: 'dwarf_warrior/hurt',
      );

  Future<SpriteAnimation> get death async => _spriteAnimation(
        count: 6,
        path: 'dwarf_warrior/death',
      );
}

class _HeadlessHorseman {
  Future<SpriteAnimation> get idle async => _spriteAnimation(
        count: 4,
        path: 'headless_horseman/idle',
      );

  Future<SpriteAnimation> get run async => _spriteAnimation(
        count: 4,
        path: 'headless_horseman/run',
      );

  Future<SpriteAnimation> get attack async => _spriteAnimation(
        count: 8,
        path: 'headless_horseman/attack',
      );

  Future<SpriteAnimation> get hurt async => _spriteAnimation(
        count: 3,
        path: 'headless_horseman/hurt',
      );

  Future<SpriteAnimation> get death async => _spriteAnimation(
        count: 10,
        path: 'headless_horseman/death',
      );
}

class _Lizardman {
  Future<SpriteAnimation> get idle async => _spriteAnimation(
        count: 3,
        path: 'lizardman/idle',
      );

  Future<SpriteAnimation> get walk async => _spriteAnimation(
        count: 6,
        path: 'lizardman/walk',
      );

  Future<SpriteAnimation> get attack async => _spriteAnimation(
        count: 6,
        path: 'lizardman/attack',
      );

  Future<SpriteAnimation> get hurt async => _spriteAnimation(
        count: 3,
        path: 'lizardman/hurt',
      );

  Future<SpriteAnimation> get death async => _spriteAnimation(
        count: 6,
        path: 'lizardman/death',
      );
}

class _Minotaur {
  Future<SpriteAnimation> get idle async => _spriteAnimation(
        count: 6,
        path: 'minotaur/idle',
      );

  Future<SpriteAnimation> get walk async => _spriteAnimation(
        count: 8,
        path: 'minotaur/walk',
      );

  Future<SpriteAnimation> get attackOne async => _spriteAnimation(
        count: 6,
        path: 'minotaur/attack_one',
      );

  Future<SpriteAnimation> get attackTwo async => _spriteAnimation(
        count: 7,
        path: 'minotaur/attack_two',
      );

  Future<SpriteAnimation> get hurt async => _spriteAnimation(
        count: 5,
        path: 'minotaur/hurt',
      );

  Future<SpriteAnimation> get death async => _spriteAnimation(
        count: 6,
        path: 'minotaur/death',
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
