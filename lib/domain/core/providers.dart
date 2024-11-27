import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/domain/entities/items/item.dart';
import 'package:my_cool_game/domain/notifiers/inventory_notifier.dart';

class Providers {
  static final inventoryProvider =
      NotifierProvider<InventoryNotifier, List<Item>>(InventoryNotifier.new);
}
