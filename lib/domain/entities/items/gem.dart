import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/domain/entities/items/item.dart';
import 'package:my_cool_game/presentation/animations/sprite_animations.dart';

class Gem extends Item {
  Gem()
      : super(
          id: 'gem',
          name: 'Gem',
          spritePath: 'item/gem.png',
        );
}

class GemDecoration extends ItemDecoration {
  GemDecoration({
    required super.position,
  }) : super.withAnimation(
          size: Vector2.all(16),
          animation: SpriteAnimations.inventory.gem,
        );
}
