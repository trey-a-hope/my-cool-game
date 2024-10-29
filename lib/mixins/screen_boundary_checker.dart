import 'package:bonfire/bonfire.dart';

mixin ScreenBoundaryChecker on GameComponent {
  checkBoundaries() {
    final mapSize = gameRef.map.size;
    final collisionBuffer = size.x / 2;

    position.x = position.x.clamp(
      -collisionBuffer,
      mapSize.x - collisionBuffer,
    );

    position.y = position.y.clamp(
      -collisionBuffer,
      mapSize.y - collisionBuffer,
    );
  }
}
