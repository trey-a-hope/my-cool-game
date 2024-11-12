import 'package:bonfire/bonfire.dart';
import 'package:bonfire/mixins/direction_animation.dart';
import 'package:my_cool_game/domain/core/enums/platform_animations_other.dart';

extension DirectionAnimationExtensions on DirectionAnimation {
  void playOnceOther({
    required PlatformAnimationsOther other,
    void Function()? onStart,
    void Function()? onFinish,
  }) =>
      animation!.playOnceOther(
        other.name,
        flipX: lastDirectionHorizontal == Direction.left,
        onStart: onStart,
        onFinish: onFinish,
      );
}
