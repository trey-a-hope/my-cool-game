import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/presentation/my_cool_game.dart';
import 'package:toastification/toastification.dart';
import 'package:window_pain/window_pain.dart';

final audios = [
  Globals.audio.backgroundMusic,
  Globals.audio.chestOpening,
  Globals.audio.collectItem,
  Globals.audio.dwarfWarriorAttack,
  Globals.audio.dwarfWarriorDie,
  Globals.audio.dwarfWarriorHurt,
  Globals.audio.flame,
  Globals.audio.gem,
  Globals.audio.gameOver,
  Globals.audio.gameWon,
  Globals.audio.headlessHorsemanAttack,
  Globals.audio.headlessHorsemanDie,
  Globals.audio.headlessHorsemanHurt,
  Globals.audio.lizardManAttack,
  Globals.audio.lizardManDie,
  Globals.audio.lizardManHurt,
  Globals.audio.minotaurAttack,
  Globals.audio.minotaurDie,
  Globals.audio.minotaurHurt,
  Globals.audio.potion,
];

late Logger logger;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  logger = Logger(
    printer: PrefixPrinter(
      PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        noBoxingByDefault: false,
      ),
    ),
    output: null,
  );

  await WindowPain.maximizeWindow();
  await FlameAudio.audioCache.loadAll(audios);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
