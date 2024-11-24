import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/presentation/animations/sprite_animations.dart';

class Blacksmith extends SimpleNpc {
  Blacksmith({required super.position})
      : super(
          size: Vector2.all(Globals.tileSize),
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimations.blacksmith.idle,
            runRight: SpriteAnimations.blacksmith.idle,
          ),
        );

  @override
  Future<void> onLoad() {
    add(size.actorToHitbox());
    return super.onLoad();
  }
}
