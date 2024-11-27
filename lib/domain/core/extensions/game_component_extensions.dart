import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/domain/entities/items/coin.dart';
import 'package:my_cool_game/domain/entities/items/gem.dart';
import 'package:my_cool_game/domain/entities/items/potion.dart';

extension GameComponentExtensions on GameComponent {
  void dropItem() {
    final pos = Vector2(
      position.x,
      position.y - (height / 2),
    );

    final items = [
      CoinDecoration(position: pos),
      GemDecoration(position: pos),
      PotionDecoration(position: pos),
    ];

    final index = Random().nextInt(items.length);

    gameRef.add(items[index]);

    removeFromParent();
  }
}
