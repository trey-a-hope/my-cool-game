import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:my_cool_game/domain/core/enums/platform_animations_other.dart';
import 'package:my_cool_game/domain/core/extensions/direction_animation_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/platform_enemy_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/domain/core/mixins/screen_boundary_checker.dart';
import 'package:my_cool_game/presentation/game/animations/sprite_animations.dart';

class HeadlessHorseman extends PlatformEnemy
    with HandleForces, ScreenBoundaryChecker, UseLifeBar {
  static const _size = Globals.tileSize * 2;

  HeadlessHorseman({
    required super.position,
  }) : super(
          life: 200,
          size: Vector2.all(_size),
          initDirection: Direction.left,
          animation: PlatformAnimations(
            idleRight: SpriteAnimations.headlessHorseman.idle,
            runRight: SpriteAnimations.headlessHorseman.run,
            others: {
              PlatformAnimationsOther.attackOne.name:
                  SpriteAnimations.headlessHorseman.attack,
              PlatformAnimationsOther.hurt.name:
                  SpriteAnimations.headlessHorseman.hurt,
              PlatformAnimationsOther.death.name:
                  SpriteAnimations.headlessHorseman.death,
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
            damage: 20,
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
    add(size.actorToHitbox());
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
