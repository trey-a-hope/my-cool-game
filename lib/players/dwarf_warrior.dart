import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cool_game/extensions/vector2_extensions.dart';
import 'package:my_cool_game/globals.dart';
import 'package:my_cool_game/mixins/screen_boundary_checker.dart';
import 'package:my_cool_game/my_cool_game.dart';
import 'package:my_cool_game/services/modal_service.dart';
import 'package:my_cool_game/sprite_animations.dart';
import 'package:toastification/toastification.dart';

class DwarfWarrior extends PlatformPlayer
    with HandleForces, MouseEventListener, ScreenBoundaryChecker {
  static const _size = Globals.tileSize * 1.5;

  final void Function() toggleDevMode;

  DwarfWarrior({
    required super.position,
    required this.toggleDevMode,
  }) : super(
          speed: 100,
          countJumps: 2,
          size: Vector2.all(_size),
          animation: PlatformAnimations(
            idleRight: SpriteAnimations.dwarfWarriorIdle,
            runRight: SpriteAnimations.dwarfWarriorWalk,
          ),
        ) {
    addForce(Globals.forces.gravity);
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

  void _bAction() => ModalService.showToast(
        title: 'B Action Called...',
        type: ToastificationType.warning,
      );

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
