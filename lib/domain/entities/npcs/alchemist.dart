import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/domain/entities/players/dwarf_warrior.dart';
import 'package:my_cool_game/presentation/animations/sprite_animations.dart';

class Alchemist extends SimpleNpc {
  bool _observedPlayer = false;

  Alchemist({required super.position})
      : super(
          size: Vector2.all(Globals.tileSize),
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimations.alchemist.idle,
            runRight: SpriteAnimations.alchemist.idle,
          ),
        );

  @override
  Future<void> onLoad() {
    add(size.actorToHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (gameRef.sceneBuilderStatus.isRunning) return;
    if (gameRef.player != null) {
      seeComponent(
        gameRef.player!,
        observed: (player) {
          _observedPlayer = true;
          (gameRef.player! as DwarfWarrior).alchemistClose = true;
        },
        notObserved: () {
          _observedPlayer = false;
          (gameRef.player! as DwarfWarrior).alchemistClose = false;
        },
        radiusVision: Globals.tileSize,
      );
    }

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (_observedPlayer) {
      animation!.showStroke(
        Colors.white,
        2,
        offset: Vector2(0, -1),
      );
    } else {
      animation!.hideStroke();
    }
    super.render(canvas);
  }
}
