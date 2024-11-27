import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:my_cool_game/domain/entities/items/item.dart';

class InventoryNotifier extends riverpod.Notifier<List<Item>> {
  @override
  List<Item> build() => [];

  void addItem(Item newItem) {
    state = [...state].map((item) {
      if (item.id == newItem.id) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();

    if (!state.any((item) => item.id == newItem.id)) {
      state = [...state, newItem];
    }
  }

  void removeItem(String itemId) {
    state = [...state]
        .map((item) {
          if (item.id == itemId) {
            final newQuantity = item.quantity - 1;
            if (newQuantity == 0) return null;
            return item.copyWith(quantity: newQuantity);
          }
          return item;
        })
        .whereType<Item>()
        .toList();
  }
}
