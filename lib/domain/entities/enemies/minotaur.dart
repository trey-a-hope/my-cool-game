import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/domain/core/enums/platform_animations_other.dart';
import 'package:my_cool_game/domain/core/extensions/direction_animation_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/game_component_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/platform_enemy_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/domain/core/mixins/screen_boundary_checker.dart';
import 'package:my_cool_game/presentation/animations/sprite_animations.dart';

class Minotaur extends PlatformEnemy
    with HandleForces, ScreenBoundaryChecker, UseLifeBar {
  static const _size = Globals.tileSize * 1.5;

  final WidgetRef ref;

  Minotaur(
    this.ref, {
    required super.position,
  }) : super(
          life: 100,
          size: Vector2.all(_size),
          initDirection: Direction.left,
          animation: PlatformAnimations(
            idleRight: SpriteAnimations.minotaur.idle,
            runRight: SpriteAnimations.minotaur.walk,
            others: {
              PlatformAnimationsOther.attackOne.name:
                  SpriteAnimations.minotaur.attackOne,
              PlatformAnimationsOther.attackTwo.name:
                  SpriteAnimations.minotaur.attackTwo,
              PlatformAnimationsOther.hurt.name: SpriteAnimations.minotaur.hurt,
              PlatformAnimationsOther.death.name:
                  SpriteAnimations.minotaur.death,
            },
          ),
        ) {
    addForce(Globals.forces.enemyGravity);

    setupLifeBar(
      borderRadius: BorderRadius.circular(2),
      borderWidth: 2,
      showLifeText: false,
    );
  }

  @override
  void update(double dt) {
    if (dt > Globals.deltaThreshold) return;
    if (gameRef.sceneBuilderStatus.isRunning) return;
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
            damage: 10,
            size: size,
            execute: () => playOnceOther(
              onStart: () => playSoundEffect(
                Globals.audio.minotaurAttack,
                ref,
              ),
              other: Random().nextBool()
                  ? PlatformAnimationsOther.attackOne
                  : PlatformAnimationsOther.attackTwo,
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
      onStart: () => playSoundEffect(
        Globals.audio.minotaurDie,
        ref,
      ),
      onFinish: () => dropItem(),
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
          onStart: () => playSoundEffect(
            Globals.audio.minotaurHurt,
            ref,
          ),
          other: PlatformAnimationsOther.hurt,
        );
      }

      super.onReceiveDamage(attacker, damage, identify);
    }
  }
}
