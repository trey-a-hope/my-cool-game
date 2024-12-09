import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_cool_game/domain/core/providers.dart';
import 'package:my_cool_game/domain/entities/players/dwarf_warrior.dart';
import 'package:my_cool_game/domain/notifiers/game_progress_notifier.dart';
import 'package:my_cool_game/presentation/my_cool_game.dart';
import 'package:my_cool_game/presentation/overlays/game_over_overlay.dart';

class MockWidgetRef extends Mock implements WidgetRef {}

class MockBonfireGame extends Mock implements BonfireGame {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Dwarf Warrior
  late DwarfWarrior warrior;
  const double defaultWarriorLife = 100;

  late Widget gameWidget;
  late MockWidgetRef ref;
  late MockBonfireGame mockGame;

  const averageAnimationDuration = Duration(seconds: 1);

  setUp(() {
    ref = MockWidgetRef();

    mockGame = MockBonfireGame();

    warrior = DwarfWarrior(
      ref,
      position: Vector2.all(20),
    );

    warrior.gameRef = mockGame;

    gameWidget = ProviderScope(
      // Override providers at the root
      overrides: [
        Providers.gameProgressProvider.overrideWith(
          () => GameProgressNotifier(), // Removed the ref parameter
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: Consumer(
            builder: (context, ref, _) => MyCoolGame(ref),
          ),
        ),
      ),
    );
  });

  group('DwarfWarrior', () {
    test('initializes with correct starting values', () {
      expect(warrior.life, equals(defaultWarriorLife));
      expect(warrior.position, equals(Vector2.all(20)));
    });

    test('takes damage correctly', () {
      warrior.onReceiveDamage(AttackOriginEnum.ENEMY, 20, null);
      expect(warrior.life, equals(80));
    });

    // TODO: Overlays are used in onDie method, but overlays are not found in this test...
    // test('dies when health reaches zero', () {
    //   warrior.onReceiveDamage(AttackOriginEnum.ENEMY, defaultWarriorLife, null);
    //   expect(warrior.isDead, isTrue);
    // });
  });

  group(
    'Game Overlay Integration Tests',
    () {
      testWidgets(
        'Shows game over overlay when player dies',
        (WidgetTester tester) async {
          await tester.pumpWidget(gameWidget);
          await tester.pump(const Duration(seconds: 1));

          final bonfireWidget =
              tester.widget<BonfireWidget>(find.byType(BonfireWidget));
          final player = bonfireWidget.player as DwarfWarrior;

          debugPrint('Initial player life: ${player.life}');

          player.onReceiveDamage(AttackOriginEnum.ENEMY, 100, null);
          debugPrint('After damage player life: ${player.life}');
          debugPrint('Is player dead: ${player.isDead}');

          await tester.pump(averageAnimationDuration);

          expect(find.byType(GameOverOverlay), findsOneWidget);

          final resetButton = find.text('Try Again?');
          expect(resetButton, findsOneWidget);

          await tester.tap(resetButton);
          await tester.pump(const Duration(milliseconds: 500));

          expect(find.byType(GameOverOverlay), findsNothing);
        },
      );
    },
  );
}
