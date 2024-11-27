import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/domain/entities/items/item.dart';
import 'package:my_cool_game/presentation/animations/sprite_animations.dart';

class Potion extends Item {
  Potion()
      : super(
          id: 'potion',
          name: 'Potion',
          spritePath: 'item/potion.png',
        );
}

class PotionDecoration extends ItemDecoration {
  PotionDecoration({
    required super.position,
  }) : super.withAnimation(
          size: Vector2.all(16),
          animation: SpriteAnimations.inventory.potion,
        );
}
