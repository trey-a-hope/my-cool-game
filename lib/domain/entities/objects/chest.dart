import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_cool_game/data/services/modal_service.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/presentation/game/animations/sprite_animations.dart';
import 'package:toastification/toastification.dart';

class Chest extends GameDecoration with Vision {
  static const _positionBuffer = 16.0;
  bool _observedPlayer = false;
  bool isOpen = false;

  Chest({required super.position})
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

      setAnimation(
        await SpriteAnimations.chest.opening,
        loop: false,
        onFinish: () async {
          setAnimation(
            await SpriteAnimations.chest.open,
          );

          ModalService.showToast(
            title: 'You got an award!',
            type: ToastificationType.success,
            icon: Icon(
              MdiIcons.trophy,
            ),
          );
        },
      );
    }
  }
}
