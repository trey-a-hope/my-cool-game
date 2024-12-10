import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/domain/core/enums/game_progress.dart';
import 'package:my_cool_game/domain/core/enums/joystick_actions.dart';
import 'package:my_cool_game/domain/core/enums/overlays.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/domain/core/providers.dart';
import 'package:my_cool_game/domain/entities/players/dwarf_warrior.dart';
import 'package:my_cool_game/presentation/backgrounds/parallax_background.dart';
import 'package:my_cool_game/presentation/overlays/game_over_overlay.dart';
import 'package:my_cool_game/presentation/overlays/game_won_overlay.dart';
import 'package:my_cool_game/presentation/overlays/settings_button_overlay.dart';
import 'package:my_cool_game/presentation/overlays/inventory_overlay.dart';
import 'package:my_cool_game/presentation/overlays/audio_settings_overlay.dart';
import 'package:my_cool_game/domain/entities/enemies/headless_horseman.dart';
import 'package:my_cool_game/domain/entities/enemies/lizardman.dart';
import 'package:my_cool_game/domain/entities/enemies/minotaur.dart';
import 'package:my_cool_game/domain/entities/npcs/alchemist.dart';
import 'package:my_cool_game/domain/entities/npcs/blacksmith.dart';
import 'package:my_cool_game/domain/entities/objects/bonfire.dart';
import 'package:my_cool_game/domain/entities/objects/chest.dart';
import 'package:my_cool_game/domain/entities/objects/plant.dart';
import 'package:my_cool_game/domain/entities/objects/world_object.dart';
import 'package:my_cool_game/presentation/overlays/start_overlay.dart';

class MyCoolGame extends StatefulWidget {
  final WidgetRef ref;

  const MyCoolGame(this.ref, {super.key});

  @override
  State<MyCoolGame> createState() => _MyCoolGameState();
}

class _MyCoolGameState extends State<MyCoolGame> {
  static const _buttonPadding = 64.0;

  static const _joystickSize = 100.0;

  static const _joystickPadding = EdgeInsets.only(
    left: _buttonPadding,
    bottom: _buttonPadding,
  );

  static const _marginButtonB = EdgeInsets.only(
    bottom: _buttonPadding * 2,
    right: _buttonPadding,
  );

  static const _marginButtonA = EdgeInsets.only(
    bottom: _buttonPadding,
    right: _buttonPadding * 2,
  );

  static const _marginButtonX = EdgeInsets.only(
    bottom: _buttonPadding * 2,
    right: _buttonPadding * 3,
  );

  static const _marginButtonY = EdgeInsets.only(
    bottom: _buttonPadding * 3,
    right: _buttonPadding * 2,
  );

  final _cameraConfig = CameraConfig(
    initialMapZoomFit: InitialMapZoomFitEnum.fitHeight,
    moveOnlyMapArea: true,
  );

  Key _gameKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    FlameAudio.bgm.dispose();
  }

  @override
  Widget build(BuildContext context) => BonfireWidget(
        key: _gameKey,
        debugMode: false,
        showCollisionArea: false,
        playerControllers: [
          Keyboard(
            config: KeyboardConfig(
              acceptedKeys: [
                LogicalKeyboardKey.space,
                LogicalKeyboardKey.keyA,
                LogicalKeyboardKey.keyB,
                LogicalKeyboardKey.keyX,
                LogicalKeyboardKey.keyY,
                LogicalKeyboardKey.keyP,
              ],
              directionalKeys: [
                KeyboardDirectionalKeys.arrows(),
              ],
            ),
          ),
          Joystick(
            directional: JoystickDirectional(
              spriteKnobDirectional: Sprite.load(
                Globals.input.leftJoystick,
              ),
              size: _joystickSize,
              margin: _joystickPadding,
            ),
            actions: [
              JoystickAction(
                actionId: JoystickActions.buttonB,
                sprite: Sprite.load(Globals.input.bUnpressed),
                spritePressed: Sprite.load(Globals.input.bPressed),
                margin: _marginButtonB,
              ),
              JoystickAction(
                actionId: JoystickActions.buttonA,
                sprite: Sprite.load(Globals.input.aUnpressed),
                spritePressed: Sprite.load(Globals.input.aPressed),
                margin: _marginButtonA,
              ),
              JoystickAction(
                actionId: JoystickActions.buttonX,
                sprite: Sprite.load(Globals.input.xUnpressed),
                spritePressed: Sprite.load(Globals.input.xPressed),
                margin: _marginButtonX,
              ),
              JoystickAction(
                actionId: JoystickActions.buttonY,
                sprite: Sprite.load(Globals.input.yUnpressed),
                spritePressed: Sprite.load(Globals.input.yPressed),
                margin: _marginButtonY,
              ),
            ],
          ),
        ],
        initialActiveOverlays: [
          Overlays.audioSettingsButton.name,
        ],
        overlayBuilderMap: {
          Overlays.start.name: (context, game) => StartOverlay(
                onStart: () {
                  game.resumeEngine();
                  game.overlays.remove(Overlays.start.name);
                  widget.ref
                      .read(Providers.gameProgressProvider.notifier)
                      .updateProgress(
                        GameProgress.start,
                      );
                },
              ),
          Overlays.gameOver.name: (context, game) => GameOverOverlay(
                onReset: _onReset,
              ),
          Overlays.gameWon.name: (context, game) => GameWonOverlay(
                onReset: _onReset,
              ),
          Overlays.inventory.name: (context, game) => InventoryOverlay(
                player: game.player,
                onClose: () {
                  game.resumeEngine();
                  game.overlays.remove(Overlays.inventory.name);
                },
              ),
          Overlays.audioSettings.name: (context, game) => AudioSettingsOverlay(
                onClose: () {
                  game.resumeEngine();
                  game.overlays.remove(Overlays.audioSettings.name);
                },
              ),
          Overlays.audioSettingsButton.name: (context, game) =>
              AudioSettingsButtonOverlay(game: game),
        },
        cameraConfig: _cameraConfig,
        player: DwarfWarrior(
          widget.ref,
          position: Vector2.all(20),
        ),
        background: ParallaxBackground(),
        lightingColorGame: Colors.white.withOpacity(0.01),
        onReady: _onReady,
        map: WorldMapBySpritefusion(
          WorldMapReader.fromAsset(Globals.map.name),
          objectsBuilder: {
            'Alchemist': (properties) => Alchemist(
                  position: properties,
                ),
            'Blacksmith': (properties) => Blacksmith(
                  position: properties,
                ),
            'Bonfire': (properties) => Bonfire(
                  position: properties,
                  ref: widget.ref,
                ),
            'Chest': (properties) => Chest(
                  position: properties,
                  ref: widget.ref,
                ),
            'Headless Horseman': (properties) => HeadlessHorseman(
                  position: properties,
                  ref: widget.ref,
                ),
            'Lizardman': (properties) => Lizardman(
                  position: properties,
                  ref: widget.ref,
                ),
            'Minotaur': (properties) => Minotaur(
                  position: properties,
                  ref: widget.ref,
                ),
            'Plant': (properties) => Plant(
                  position: properties,
                ),
            'World Object': (properties) => WorldObject(
                  position: properties,
                ),
          },
        ),
      );

  void _onReset() {
    widget.ref.read(Providers.gameProgressProvider.notifier).updateProgress(
          GameProgress.start,
        );

    widget.ref.read(Providers.inventoryProvider.notifier).resetInventory();

    setState(() => _gameKey = UniqueKey());
  }

  void _onReady(BonfireGameInterface game) {
    debugPrint('"My Cool Game" is now ready. 👍🏾');

    game.pauseEngine();

    if (widget.ref.read(Providers.gameProgressProvider) == GameProgress.menu) {
      game.overlays.add(Overlays.start.name);
    }

    widget.ref.read(Providers.audioSettingsProvider.notifier).initializeMusic(
          Globals.audio.backgroundMusic,
        );
  }
}
