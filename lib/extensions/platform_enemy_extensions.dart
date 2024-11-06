import 'package:bonfire/bonfire.dart';

extension PlatformEnemyExtensions on PlatformEnemy {
  bool canGiveDamage(Player player) {
    if (!_yDistanceClose(player)) {
      return false;
    }

    final centers = _getAbsoluteCenters(player);

    final playerAbsoluteCenter = centers.$1;
    final enemyAbsoluteCenter = centers.$2;

    if (playerAbsoluteCenter.x < enemyAbsoluteCenter.x) {
      if (lastDirectionHorizontal == Direction.right) {
        return false;
      }
    } else {
      if (lastDirectionHorizontal == Direction.left) {
        return false;
      }
    }

    return true;
  }

  bool canReceiveDamage(Player player) {
    if (!_yDistanceClose(player)) {
      return false;
    }

    final centers = _getAbsoluteCenters(player);

    final playerAbsoluteCenter = centers.$1;
    final enemyAbsoluteCenter = centers.$2;

    if (playerAbsoluteCenter.x < enemyAbsoluteCenter.x) {
      if (player.lastDirectionHorizontal == Direction.left) {
        return false;
      }
    } else {
      if (player.lastDirectionHorizontal == Direction.right) {
        return false;
      }
    }

    return true;
  }

  (Vector2, Vector2) _getAbsoluteCenters(Player player) {
    final playerHitbox = player.getHitboxes.first;
    final enemyHitbox = getHitboxes.first;

    final playerAbsoluteCenter = playerHitbox.absoluteCenter;
    final enemyAbsoluteCenter = enemyHitbox.absoluteCenter;

    return (playerAbsoluteCenter, enemyAbsoluteCenter);
  }

  bool _yDistanceClose(Player player) {
    final centers = _getAbsoluteCenters(player);

    final playerAbsoluteCenter = centers.$1;
    final enemyAbsoluteCenter = centers.$2;

    final yDiff = (playerAbsoluteCenter.y - enemyAbsoluteCenter.y).abs();

    return yDiff < 5;
  }
}
