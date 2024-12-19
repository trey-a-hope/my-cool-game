import 'package:bonfire/base/bonfire_game.dart';
import 'package:flutter/material.dart';
import 'package:my_cool_game/domain/core/enums/overlays.dart';

class AudioSettingsButtonOverlay extends StatelessWidget {
  final BonfireGame game;

  const AudioSettingsButtonOverlay({
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            top: 32,
            right: 32,
            child: Material(
              type: MaterialType.transparency,
              child: GestureDetector(
                onTap: () {
                  game.pauseEngine();
                  game.overlays.add(
                    Overlays.audioSettings.name,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(
                    8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(
                      alpha: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          )
        ],
      );
}
