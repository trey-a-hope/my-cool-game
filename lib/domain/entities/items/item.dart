import 'package:bonfire/bonfire.dart';
import 'package:my_cool_game/domain/entities/players/dwarf_warrior.dart';

class Item {
  final String id;
  final String name;
  final String spritePath;
  final int quantity;

  Item({
    required this.id,
    required this.name,
    required this.spritePath,
    this.quantity = 1,
  });

  Item copyWith({
    String? id,
    String? name,
    String? spritePath,
    int? quantity,
  }) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        spritePath: spritePath ?? this.spritePath,
        quantity: quantity ?? this.quantity,
      );
}

class ItemDecoration extends GameDecoration with Sensor<DwarfWarrior> {
  ItemDecoration.withAnimation({
    required super.animation,
    required super.position,
    required super.size,
  }) : super.withAnimation();

  @override
  void onContact(DwarfWarrior component) {
    removeFromParent();
    super.onContact(component);
  }
}
