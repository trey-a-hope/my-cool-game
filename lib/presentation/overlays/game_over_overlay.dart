import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/presentation/overlays/overlay_container.dart';

class GameOverOverlay extends StatelessWidget {
  final void Function() onReset;

  const GameOverOverlay({
    required this.onReset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return OverlayContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Globals.lottie.gameOver,
            height: height * 0.5,
          ),
          const Gap(32),
          ElevatedButton(
            onPressed: onReset,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Try Again?',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
