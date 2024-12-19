import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/domain/core/enums/game_progress.dart';
import 'package:my_cool_game/domain/core/models/audio_settings.dart';
import 'package:my_cool_game/domain/entities/items/item.dart';
import 'package:my_cool_game/domain/notifiers/audio_settings_notifier.dart';
import 'package:my_cool_game/domain/notifiers/game_progress_notifier.dart';
import 'package:my_cool_game/domain/notifiers/inventory_notifier.dart';

class Providers {
  static final audioSettingsProvider =
      NotifierProvider<AudioSettingsNotifier, AudioSettings>(
    AudioSettingsNotifier.new,
  );

  static final gameProgressProvider =
      NotifierProvider<GameProgressNotifier, GameProgress>(
    GameProgressNotifier.new,
  );

  static final inventoryProvider =
      NotifierProvider<InventoryNotifier, List<Item>>(
    InventoryNotifier.new,
  );
}
