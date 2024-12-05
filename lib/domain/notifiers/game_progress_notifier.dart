import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:my_cool_game/domain/core/enums/game_progress.dart';

class GameProgressNotifier extends riverpod.Notifier<GameProgress> {
  static const _images = 'assets/images/';

  final dwarf = Image.asset(
    '${_images}dwarf_warrior/idle/0.png',
    scale: 0.3,
  );

  final alchemist = Image.asset(
    '${_images}alchemist/0.png',
    scale: 0.5,
  );

  final blacksmith = Image.asset(
    '${_images}blacksmith/0.png',
    scale: 0.5,
  );

  static const charcoalText = TextSpan(
    text: 'charcoal',
    style: TextStyle(
      color: Colors.grey,
    ),
  );

  static const elixerText = TextSpan(
    text: 'elixer',
    style: TextStyle(
      color: Colors.green,
    ),
  );

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
            person: dwarf,
          ),
          Say(
            text: [
              const TextSpan(text: 'Why yes I do! I need some '),
              charcoalText,
              const TextSpan(text: ' to make my '),
              elixerText,
              const TextSpan(text: '.'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: alchemist,
          ),
          Say(
            text: [
              const TextSpan(text: 'Say less ma.'),
            ],
            personSayDirection: PersonSayDirection.LEFT,
            person: dwarf,
          ),
        ];
      case GameProgress.searching:
        return [
          Say(
            text: [
              const TextSpan(text: 'Have you found the '),
              charcoalText,
              const TextSpan(text: ' so I can make my '),
              elixerText,
              const TextSpan(text: '?'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: alchemist,
          ),
        ];
      case GameProgress.charcoalCollected:
        return [
          Say(
            text: [
              const TextSpan(text: 'You found it! Now I can make my '),
              elixerText,
              const TextSpan(text: '.'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: alchemist,
          ),
          Say(
            text: [
              const TextSpan(
                text:
                    'And here it is! Can you deliver this to my husband please?',
              ),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: alchemist,
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
            person: alchemist,
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
            person: blacksmith,
          ),
        ];
      case GameProgress.searching:
        return [
          Say(
            text: [
              const TextSpan(text: 'A little blue bird told me you need some '),
              charcoalText,
              const TextSpan(text: '. Well here it is!'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: blacksmith,
          ),
        ];
      case GameProgress.charcoalCollected:
        return [
          Say(
            text: [
              const TextSpan(text: 'Well what are you waiting for lad?'),
            ],
            personSayDirection: PersonSayDirection.RIGHT,
            person: blacksmith,
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
            person: blacksmith,
          ),
        ];
    }
  }
}
