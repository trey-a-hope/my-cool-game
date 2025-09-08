import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/domain/core/enums/platform_animations_other.dart';
import 'package:my_cool_game/domain/core/extensions/direction_animation_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/game_component_extensions.dart';
import 'package:my_cool_game/domain/core/extensions/vector2_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/domain/entities/players/dwarf_warrior.dart';
import 'package:my_cool_game/presentation/animations/sprite_animations.dart';

class Bonfire extends GameDecoration with Sensor<DwarfWarrior> {
  static const _positionBuffer = 16.0;
  static const _damage = 5.0;

  final WidgetRef ref;

  Bonfire(this.ref, {required Vector2 position})
      : super.withAnimation(
          animation: SpriteAnimations.bonfire.idle,
          size: Vector2(
            Globals.tileSize,
            Globals.tileSize + _positionBuffer,
          ),
          position: Vector2(
            position.x,
            position.y - _positionBuffer,
          ),
        ) {
    // setSensorInterval(500);

    setupLighting(
      LightingConfig(
        radius: Globals.tileSize,
        color: Colors.yellow.withValues(alpha: 0.3),
      ),
    );
  }

  @override
  void onContact(DwarfWarrior component) {
    component.showDamage(
      _damage,
      config: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
    component.playSoundEffect(Globals.audio.flame, ref);

    component.playOnceOther(
      other: PlatformAnimationsOther.hurt,
    );

    component.removeLife(_damage);

    super.onContact(component);
  }

  @override
  Future<void> onLoad() {
    add(size.objectToHitbox());
    return super.onLoad();
  }
}
