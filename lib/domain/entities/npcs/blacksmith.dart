import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/core/globals.dart';
import 'package:my_cool_game/presentation/game/sprite_animations.dart';

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
    add(size.sizeToHitbox());
    return super.onLoad();
  }
}
