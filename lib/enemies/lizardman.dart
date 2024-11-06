import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:my_cool_game/enums/platform_animations_other.dart';
import 'package:my_cool_game/extensions/direction_animation_extensions.dart';
import 'package:my_cool_game/extensions/platform_enemy_extensions.dart';
import 'package:my_cool_game/extensions/vector2_extensions.dart';
import 'package:my_cool_game/globals.dart';
import 'package:my_cool_game/mixins/screen_boundary_checker.dart';
import 'package:my_cool_game/sprite_animations.dart';

class Lizardman extends PlatformEnemy
    with HandleForces, ScreenBoundaryChecker, UseLifeBar {
  static const _size = Globals.tileSize * 1.5;

  Lizardman({
    required super.position,
  }) : super(
          life: 50,
          size: Vector2.all(_size),
          animation: PlatformAnimations(
            idleRight: SpriteAnimations.lizardman.idle,
            runRight: SpriteAnimations.lizardman.walk,
            others: {
              PlatformAnimationsOther.attackOne.name:
                  SpriteAnimations.lizardman.attack,
              PlatformAnimationsOther.hurt.name:
                  SpriteAnimations.lizardman.hurt,
              PlatformAnimationsOther.death.name:
                  SpriteAnimations.lizardman.death,
            },
          ),
        ) {
    addForce(Globals.forces.gravity);

    setupLifeBar(
      borderRadius: BorderRadius.circular(2),
      borderWidth: 2,
      showLifeText: false,
    );
  }

  @override
  void update(double dt) {
    checkBoundaries();

    seeAndMoveToPlayer(
      movementAxis: MovementAxis.horizontal,
      closePlayer: (player) {
        animation?.showStroke(
          Colors.red,
          2,
        );

        if (canGiveDamage(player)) {
          simpleAttackMelee(
            damage: 5,
            size: size,
            execute: () => playOnceOther(
              other: PlatformAnimationsOther.attackOne,
            ),
          );
        }
      },
      notObserved: () {
        animation?.hideStroke();
        return true;
      },
    );

    super.update(dt);
  }

  @override
  Future<void> onLoad() {
    add(size.sizeToHitbox());
    return super.onLoad();
  }

  @override
  void onDie() {
    playOnceOther(
      other: PlatformAnimationsOther.death,
      onFinish: () => removeFromParent(),
    );
    super.onDie();
  }

  @override
  void onReceiveDamage(
    AttackOriginEnum attacker,
    double damage,
    identify,
  ) {
    if (canReceiveDamage(gameRef.player!)) {
      if (damage < life) {
        playOnceOther(
          other: PlatformAnimationsOther.hurt,
        );
      }

      super.onReceiveDamage(attacker, damage, identify);
    }
  }
}
