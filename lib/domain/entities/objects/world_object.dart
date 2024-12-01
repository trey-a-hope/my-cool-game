import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';

class WorldObject extends GameDecoration {
  WorldObject({required super.position})
      : super.withSprite(
          sprite: Sprite.load('world_object/${Random().nextInt(6)}.png'),
          size: Vector2.all(Globals.tileSize),
        );

  @override
  Future<void> onLoad() {
    add(size.objectToHitbox());
    return super.onLoad();
  }
}
