import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cool_game/domain/core/enums/joystick_actions.dart';
import 'package:my_cool_game/domain/core/enums/platform_animations_other.dart';
import 'package:my_cool_game/domain/core/extensions/direction_animation_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/domain/core/mixins/screen_boundary_checker.dart';
import 'package:my_cool_game/data/services/modal_service.dart';
import 'package:my_cool_game/presentation/game/animations/sprite_animations.dart';
import 'package:toastification/toastification.dart';

class DwarfWarrior extends PlatformPlayer
    with HandleForces, MouseEventListener, ScreenBoundaryChecker, UseLifeBar {
  static const _size = Globals.tileSize * 1.5;

  final void Function() toggleDevMode;

  bool _canAttack = true;

  DwarfWarrior({
    required super.position,
    required this.toggleDevMode,
  }) : super(
          speed: 100,
          countJumps: 2,
          size: Vector2.all(_size),
          animation: PlatformAnimations(
            idleRight: SpriteAnimations.dwarfWarrior.idle,
            runRight: SpriteAnimations.dwarfWarrior.walk,
            others: {
              PlatformAnimationsOther.attackOne.name:
                  SpriteAnimations.dwarfWarrior.attack,
              PlatformAnimationsOther.hurt.name:
                  SpriteAnimations.dwarfWarrior.hurt,
              PlatformAnimationsOther.death.name:
                  SpriteAnimations.dwarfWarrior.death,
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
  void onJoystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN) {
      if (event.id == LogicalKeyboardKey.space ||
          event.id == LogicalKeyboardKey.keyA ||
          event.id == JoystickActions.buttonA) {
        _aAction();
      }

      if (event.id == LogicalKeyboardKey.keyB ||
          event.id == JoystickActions.buttonB) {
        _bAction();
      }

      if (event.id == LogicalKeyboardKey.keyX ||
          event.id == JoystickActions.buttonX) {
        _xAction();
      }

      if (event.id == LogicalKeyboardKey.keyY ||
          event.id == JoystickActions.buttonY) {
        _yAction();
      }

      if (event.id == LogicalKeyboardKey.keyP) {
        _togglePause();
      }
    }

    super.onJoystickAction(event);
  }

  @override
  void update(double dt) {
    checkBoundaries();
    super.update(dt);
  }

  @override
  Future<void> onLoad() {
    add(size.sizeToHitbox());
    return super.onLoad();
  }

  @override
  void onMouseTap(MouseButton button) => toggleDevMode();

  void _aAction() => jump();

  void _bAction() {
    if (_canAttack) {
      playOnceOther(
        other: PlatformAnimationsOther.attackOne,
        onStart: () => _canAttack = false,
        onFinish: () => _canAttack = true,
      );

      simpleAttackMelee(
        damage: 10,
        size: size,
      );
    }
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
    if (damage < life) {
      playOnceOther(
        other: PlatformAnimationsOther.hurt,
      );
    }

    super.onReceiveDamage(attacker, damage, identify);
  }

  void _xAction() => ModalService.showToast(
        title: 'X Action Called...',
        type: ToastificationType.warning,
      );

  void _yAction() => ModalService.showToast(
        title: 'Y Action Called...',
        type: ToastificationType.warning,
      );

  void _togglePause() {
    final isPaused = gameRef.paused;

    isPaused ? gameRef.resumeEngine() : gameRef.pauseEngine();

    ModalService.showToast(
      title: isPaused ? 'Game resumed!' : 'Game paused...',
      type: isPaused ? ToastificationType.success : ToastificationType.warning,
      icon: isPaused ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
    );
  }
}
