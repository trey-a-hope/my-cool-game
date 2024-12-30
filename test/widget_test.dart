import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_cool_game/domain/core/enums/overlays.dart';
import 'package:my_cool_game/domain/core/providers.dart';
import 'package:my_cool_game/domain/notifiers/game_progress_notifier.dart';
import 'package:my_cool_game/presentation/my_cool_game.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Widget gameWidget;
  late GameProgressNotifier gameProgressNotifier;

  const averageAnimationDuration = Duration(seconds: 1);

  setUp(
    () {
      gameProgressNotifier = GameProgressNotifier();

      gameWidget = ProviderScope(
        overrides: [
          Providers.gameProgressProvider
              .overrideWith(() => gameProgressNotifier)
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, _) => MyCoolGame(ref),
            ),
          ),
        ),
      );
    },
  );

  group(
    'Game Starts Properly',
    () {
      testWidgets(
        'BonfireWidget initializes with correct configuration',
        (WidgetTester tester) async {
          await tester.pumpWidget(gameWidget);
          await tester.pump();
          await tester.pump(averageAnimationDuration);

          final bonfireWidget = tester.widget<BonfireWidget>(
            find.byType(BonfireWidget),
          );

          expect(bonfireWidget.debugMode, isFalse);
          expect(bonfireWidget.showCollisionArea, isFalse);
          expect(
            bonfireWidget.initialActiveOverlays,
            contains(
              Overlays.audioSettingsButton.name,
            ),
          );
        },
      );
    },
  );
}
