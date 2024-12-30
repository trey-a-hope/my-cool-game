import 'package:bonfire/bonfire.dart';

class ParallaxBackground extends GameBackground {
  static const _sky = 'background/sky.png';
  static const _clouds = 'background/clouds.png';
  static const _mountains = 'background/mountains.png';
  static const _hills = 'background/hills.png';

  ParallaxComponent? _skyAndClouds;
  ParallaxComponent? _mountainsAndHills;

  @override
  void onMount() {
    _addParallax();
    super.onMount();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    if (!gameRef.sceneBuilderStatus.isRunning) {
      _skyAndClouds?.removeFromParent();
      _mountainsAndHills?.removeFromParent();

      _addParallax();
    }
  }

  void _addParallax() async {
    _skyAndClouds = await loadParallaxComponent(
      [
        ParallaxImageData(_sky),
        ParallaxImageData(_clouds),
      ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.5, 1),
    );

    add(_skyAndClouds!);

    _mountainsAndHills = await loadCameraParallaxComponent(
      [
        ParallaxImageData(_mountains),
        ParallaxImageData(_hills),
      ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(3, 1),
    );

    add(_mountainsAndHills!);
  }
}
