import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/domain/core/extensions/game_component_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/presentation/animations/sprite_animations.dart';

class Chest extends GameDecoration with Vision {
  static const _positionBuffer = 16.0;
  bool _observedPlayer = false;
  bool isOpen = false;

  final WidgetRef ref;

  Chest(this.ref, {required super.position})
      : super.withAnimation(
          animation: SpriteAnimations.chest.closed,
          size: Vector2(
            Globals.tileSize + _positionBuffer,
            Globals.tileSize,
          ),
        );

  @override
  Future<void> onLoad() {
    add(size.objectToHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (gameRef.sceneBuilderStatus.isRunning) return;

    if (gameRef.player != null) {
      seeComponent(
        gameRef.player!,
        observed: (player) => _observedPlayer = true,
        notObserved: () => _observedPlayer = false,
        radiusVision: Globals.tileSize,
      );
    }

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (_observedPlayer) {
      showAnimationStroke(
        Colors.white,
        2,
        offset: Vector2(1, -1),
      );
    } else {
      hideAnimationStroke();
    }
    super.render(canvas);
  }

  void openChest() async {
    if (_observedPlayer) {
      isOpen = true;

      playSoundEffect(Globals.audio.chestOpening, ref);

      setAnimation(
        await SpriteAnimations.chest.opening,
        loop: false,
        onFinish: () async {
          setAnimation(
            await SpriteAnimations.chest.open,
          );

          dropItem();
        },
      );
    }
  }
}
