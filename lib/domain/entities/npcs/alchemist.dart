import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/core/globals.dart';
import 'package:my_cool_game/presentation/game/sprite_animations.dart';

class Alchemist extends SimpleNpc {
  Alchemist({required super.position})
      : super(
          size: Vector2.all(Globals.tileSize),
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimations.alchemist.idle,
            runRight: SpriteAnimations.alchemist.idle,
          ),
        );

  @override
  Future<void> onLoad() {
    add(size.sizeToHitbox());
    return super.onLoad();
  }
}