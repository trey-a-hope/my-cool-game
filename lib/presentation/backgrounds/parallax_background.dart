import 'package:bonfire/bonfire.dart';

class ParallaxBackground extends GameBackground {
  static const _sky = 'background/sky.png';
  static const _clouds = 'background/clouds.png';
  static const _mountains = 'background/mountains.png';
  static const _hills = 'background/hills.png';

  @override
  void onMount() {
    _addParallax();
    super.onMount();
  }

  void _addParallax() async {
    final parallaxComponent = await loadParallaxComponent(
      [
        ParallaxImageData(_sky),
        ParallaxImageData(_clouds),
      ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.5, 1),
    );

    add(parallaxComponent);

    final cameraParallaxComponent = await loadCameraParallaxComponent(
      [
        ParallaxImageData(_mountains),
        ParallaxImageData(_hills),
      ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(3, 1),
    );

    add(cameraParallaxComponent);
  }
}
