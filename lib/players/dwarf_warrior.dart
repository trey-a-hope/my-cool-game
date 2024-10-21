import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/globals.dart';
import 'package:my_cool_game/sprite_animations.dart';

class DwarfWarrior extends PlatformPlayer {
  static const _size = Globals.tileSize * 1.5;

  DwarfWarrior({required super.position})
      : super(
          size: Vector2.all(_size),
          animation: PlatformAnimations(
            idleRight: SpriteAnimations.dwarfWarriorIdle,
            runRight: SpriteAnimations.dwarfWarriorWalk,
          ),
        );
}
