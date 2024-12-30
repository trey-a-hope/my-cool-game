import 'package:bonfire/bonfire.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_cool_game/domain/entities/players/dwarf_warrior.dart';

class MockWidgetRef extends Mock implements WidgetRef {}

class MockBonfireGame extends Mock implements BonfireGame {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const double defaultWarriorLife = 100;

  late DwarfWarrior warrior;
  late MockWidgetRef ref;
  late MockBonfireGame mockGame;

  setUp(
    () {
      ref = MockWidgetRef();

      mockGame = MockBonfireGame();

      warrior = DwarfWarrior(
        ref,
        position: Vector2.all(20),
      );

      warrior.gameRef = mockGame;
    },
  );

  group(
    'DwarfWarrior',
    () {
      test(
        'initializes with correct starting values',
        () {
          expect(warrior.life, equals(defaultWarriorLife));
          expect(warrior.position, equals(Vector2.all(20)));
        },
      );

      test(
        'takes damage correctly',
        () {
          warrior.onReceiveDamage(AttackOriginEnum.ENEMY, 20, null);
          expect(warrior.life, equals(80));
        },
      );
    },
  );
}
