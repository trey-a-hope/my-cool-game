import 'package:bonfire/bonfire.dart';

extension Vector2Extensions on Vector2 {
  RectangleHitbox sizeToHitbox() => RectangleHitbox(
        size: Vector2.all(x / 2),
        position: Vector2(x / 4, y / 2),
        isSolid: true,
      );
}
