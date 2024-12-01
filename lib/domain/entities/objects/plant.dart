import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/domain/core/globals.dart';

class Plant extends GameDecoration {
  Plant({
    required super.position,
  }) : super.withSprite(
          sprite: Sprite.load('plant/${Random().nextInt(18)}.png'),
          size: Vector2.all(Globals.tileSize),
        );
}
