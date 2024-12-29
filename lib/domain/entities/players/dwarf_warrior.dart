import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/domain/core/enums/game_progress.dart';
import 'package:my_cool_game/domain/core/enums/joystick_actions.dart';
import 'package:my_cool_game/domain/core/enums/overlays.dart';
import 'package:my_cool_game/domain/core/enums/platform_animations_other.dart';
import 'package:my_cool_game/domain/core/extensions/direction_animation_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/game_component_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/domain/core/mixins/screen_boundary_checker.dart';
import 'package:my_cool_game/data/services/modal_service.dart';
import 'package:my_cool_game/domain/core/providers.dart';
import 'package:my_cool_game/domain/entities/items/charcoal.dart';
import 'package:my_cool_game/domain/entities/items/coin.dart';
import 'package:my_cool_game/domain/entities/items/elixer.dart';
import 'package:my_cool_game/domain/entities/items/gem.dart';
import 'package:my_cool_game/domain/entities/items/item.dart';
import 'package:my_cool_game/domain/entities/items/potion.dart';
import 'package:my_cool_game/domain/entities/objects/chest.dart';
import 'package:my_cool_game/presentation/animations/sprite_animations.dart';
import 'package:toastification/toastification.dart';

class DwarfWarrior extends PlatformPlayer
    with HandleForces, ScreenBoundaryChecker, UseLifeBar {
  static const _size = Globals.tileSize * 1.5;

  final WidgetRef ref;

  bool _canAttack = true;

  Chest? _recentChest;

  bool alchemistClose = false;
  bool blacksmithClose = false;

  DwarfWarrior(
    this.ref, {
    required super.position,
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
    addForce(Globals.forces.playerGravity);

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
    if (dt > Globals.deltaThreshold) return;
    if (gameRef.sceneBuilderStatus.isRunning) return;

    if (dt > Globals.deltaThreshold) return;
    checkBoundaries();
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
      onStart: () {
        playSoundEffect(Globals.audio.dwarfWarriorHurt, ref);
        playSoundEffect(Globals.audio.gameOver, ref);
      },
      onFinish: () {
        removeFromParent();
        gameRef.overlays.add(Overlays.gameOver.name);
      },
    );
    super.onDie();

    if (kDebugMode) {
      gameRef.overlays.add(Overlays.gameOver.name);
    } else {
      playOnceOther(
        other: PlatformAnimationsOther.death,
        onFinish: () {
          removeFromParent();
          gameRef.overlays.add(Overlays.gameOver.name);
        },
      );
    }
  }

  @override
  void onReceiveDamage(
    AttackOriginEnum attacker,
    double damage,
    identify,
  ) {
    if (damage < life) {
      playOnceOther(
        onStart: () => playSoundEffect(
          Globals.audio.dwarfWarriorHurt,
          ref,
        ),
        other: PlatformAnimationsOther.hurt,
      );
    }

    super.onReceiveDamage(attacker, damage, identify);
  }

  @override
  void onCollision(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    Item? item;

    switch (other) {
      case Chest():
        _recentChest = other;
        break;
      case PotionDecoration():
        item = Potion();
        break;
      case GemDecoration():
        item = Gem();
        break;
      case CoinDecoration():
        item = Coin();
        break;
    }

    if (item != null) {
      _receiveItem(item);
    }

    super.onCollision(intersectionPoints, other);
  }

  void _aAction() => jump();

  void _bAction() {
    if (_canAttack) {
      playOnceOther(
        other: PlatformAnimationsOther.attackOne,
        onStart: () {
          _canAttack = false;
          playSoundEffect(
            Globals.audio.dwarfWarriorAttack,
            ref,
          );
        },
        onFinish: () => _canAttack = true,
      );

      simpleAttackMelee(
        damage: 10,
        size: size,
      );
    }
  }

  void _xAction() {
    if (_recentChest != null && !_recentChest!.isOpen) {
      _recentChest!.openChest();
    }

    if (alchemistClose) {
      _initiateAlchemistDialog();
    }

    if (blacksmithClose) {
      _initiateBlacksmithDialog();
    }
  }

  void _yAction() {
    gameRef.pauseEngine();
    gameRef.overlays.add(Overlays.inventory.name);
  }

  void _togglePause() {
    final isPaused = gameRef.paused;

    isPaused ? gameRef.resumeEngine() : gameRef.pauseEngine();

    ModalService.showToast(
      title: isPaused ? 'Game resumed!' : 'Game paused...',
      type: isPaused ? ToastificationType.success : ToastificationType.warning,
      icon: isPaused ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
    );
  }

  void _receiveItem(Item item) {
    ref.read(Providers.inventoryProvider.notifier).addItem(item);

    playSoundEffect(Globals.audio.collectItem, ref);

    ModalService.showToast(
      title: '${item.name} added to inventory.',
      type: ToastificationType.success,
      icon: Image.asset(
        'assets/images/${item.spritePath}',
        width: Globals.tileSize,
        height: Globals.tileSize,
      ),
    );
  }

  void _initiateAlchemistDialog() {
    final conversation =
        ref.read(Providers.gameProgressProvider.notifier).getAlchemistDialog();

    TalkDialog.show(
      context,
      conversation,
      onFinish: () {
        switch (ref.read(Providers.gameProgressProvider)) {
          case GameProgress.menu:
            break;
          case GameProgress.start:
            ref.read(Providers.gameProgressProvider.notifier).updateProgress(
                  GameProgress.searching,
                );
            break;
          case GameProgress.searching:
            break;
          case GameProgress.charcoalCollected:
            ref.read(Providers.inventoryProvider.notifier).removeItem(
                  Charcoal().id,
                );

            if (!ref.read(Providers.inventoryProvider.notifier).hasItem(
                  Elixer().id,
                )) {
              _receiveItem(Elixer());
            }

            ref.read(Providers.gameProgressProvider.notifier).updateProgress(
                  GameProgress.elixerCollected,
                );
            break;
          case GameProgress.elixerCollected:
            break;
        }
      },
    );
  }

  void _initiateBlacksmithDialog() {
    final conversation =
        ref.read(Providers.gameProgressProvider.notifier).getBlacksmithDialog();

    TalkDialog.show(
      context,
      conversation,
      onFinish: () {
        switch (ref.read(Providers.gameProgressProvider)) {
          case GameProgress.menu:
            break;
          case GameProgress.start:
            break;
          case GameProgress.searching:
            if (!ref.read(Providers.inventoryProvider.notifier).hasItem(
                  Charcoal().id,
                )) {
              _receiveItem(Charcoal());
            }

            ref.read(Providers.gameProgressProvider.notifier).updateProgress(
                  GameProgress.charcoalCollected,
                );

            break;
          case GameProgress.charcoalCollected:
            break;
          case GameProgress.elixerCollected:
            gameRef.overlays.add(Overlays.gameWon.name);
            playSoundEffect(Globals.audio.gameWon, ref);
            break;
        }
      },
    );
  }
}
