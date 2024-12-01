import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/presentation/my_cool_game.dart';
import 'package:toastification/toastification.dart';

void main() {
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
