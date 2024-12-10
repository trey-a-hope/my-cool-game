import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:my_cool_game/domain/core/enums/game_progress.dart';
import 'package:my_cool_game/domain/core/globals.dart';

class GameProgressNotifier extends riverpod.Notifier<GameProgress> {
  @override
  GameProgress build() => GameProgress.start;

  void updateProgress(GameProgress progress) => state = progress;

  List<Say> getAlchemistDialog() {
    switch (state) {
      case GameProgress.start:
        return [
          Say(
            text: [
              const TextSpan(text: 'Hello mam, do you need help?'),
            ],
            personSayDirection: PersonSayDirection.LEFT,
            person: Globals.imageAssets.dwarf,
          ),
          Say(
            text: [
              const TextSpan(text: 'Why yes I do! I need some '),
              Globals.imageAssets.charcoalText,
              const TextSpan(text: ' to make my '),
              Globals.imageAssets.elixerText,
              const TextSpan(text: '.'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: Globals.imageAssets.alchemist,
          ),
          Say(
            text: [
              const TextSpan(text: 'Say less ma.'),
            ],
            personSayDirection: PersonSayDirection.LEFT,
            person: Globals.imageAssets.dwarf,
          ),
        ];
      case GameProgress.searching:
        return [
          Say(
            text: [
              const TextSpan(text: 'Have you found the '),
              Globals.imageAssets.charcoalText,
              const TextSpan(text: ' so I can make my '),
              Globals.imageAssets.elixerText,
              const TextSpan(text: '?'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: Globals.imageAssets.alchemist,
          ),
        ];
      case GameProgress.charcoalCollected:
        return [
          Say(
            text: [
              const TextSpan(text: 'You found it! Now I can make my '),
              Globals.imageAssets.elixerText,
              const TextSpan(text: '.'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: Globals.imageAssets.alchemist,
          ),
          Say(
            text: [
              const TextSpan(
                text:
                    'And here it is! Can you deliver this to my husband please?',
              ),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: Globals.imageAssets.alchemist,
          ),
        ];
      case GameProgress.elixerCollected:
        return [
          Say(
            text: [
              const TextSpan(
                text: 'Don\'t keep my husband waiting please!',
              ),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: Globals.imageAssets.alchemist,
          ),
        ];
    }
  }

  List<Say> getBlacksmithDialog() {
    switch (state) {
      case GameProgress.start:
        return [
          Say(
            text: [
              const TextSpan(
                  text:
                      'Hello there lad, I think my wife needs some help. Can you talk to her for me?'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: Globals.imageAssets.blacksmith,
          ),
        ];
      case GameProgress.searching:
        return [
          Say(
            text: [
              const TextSpan(text: 'A little blue bird told me you need some '),
              Globals.imageAssets.charcoalText,
              const TextSpan(text: '. Well here it is!'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: Globals.imageAssets.blacksmith,
          ),
        ];
      case GameProgress.charcoalCollected:
        return [
          Say(
            text: [
              const TextSpan(text: 'Well what are you waiting for lad?'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: Globals.imageAssets.blacksmith,
          ),
        ];
      case GameProgress.elixerCollected:
        return [
          Say(
            text: [
              const TextSpan(
                  text:
                      'Ah thank you! I needed this more than you could ever know!'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: Globals.imageAssets.blacksmith,
          ),
        ];
    }
  }
}
