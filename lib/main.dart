import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/presentation/my_cool_game.dart';
import 'package:toastification/toastification.dart';

final audio = [
  Globals.audio.backgroundMusic,
  Globals.audio.chestOpening,
  // final collectItem = 'collect_item.wav';
  // final dwarfWarriorAttack = 'dwarf_warrior_attack.mp3';
  // final dwarfWarriorDie = 'dwarf_warrior_die.wav';
  // final dwarfWarriorHurt = 'dwarf_warrior_hurt.wav';
  // final flame = 'flame.wav';
  // final gem = 'gem.flac';
  // final gameOver = 'game_over.wav';
  // final gameWon = 'game_won.wav';
  // final headlessHorsemanAttack = 'headless_horseman_attack.wav';
  // final headlessHorsemanDie = 'headless_horseman_die.wav';
  // final headlessHorsemanHurt = 'headless_horseman_hurt.wav';
  // final lizardManAttack = 'lizard_man_attack.wav';
  // final lizardManDie = 'lizard_man_die.wav';
  // final lizardManHurt = 'lizard_man_hurt.mp3';
  // final minotaurAttack = 'minotaur_attack.wav';
  // final minotaurDie = 'minotaur_die.wav';
  // final minotaurHurt = 'minotaur_hurt.wav';
  // final potion = 'potion.wav';
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlameAudio.audioCache.loadAll(audio);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: ToastificationWrapper(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Cool Game',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
              ),
              useMaterial3: true,
            ),
            home: const GameScreen(),
          ),
        ),
      );
}

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MyCoolGame(ref);
}
