import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cool_game/domain/entities/enemies/headless_horseman.dart';
import 'package:my_cool_game/domain/entities/enemies/lizardman.dart';
import 'package:my_cool_game/domain/entities/enemies/minotaur.dart';
import 'package:my_cool_game/core/enums/joystick_actions.dart';
import 'package:my_cool_game/core/globals.dart';
import 'package:my_cool_game/domain/entities/npcs/alchemist.dart';
import 'package:my_cool_game/domain/entities/npcs/blacksmith.dart';
import 'package:my_cool_game/domain/entities/players/dwarf_warrior.dart';

class MyCoolGame extends StatefulWidget {
  const MyCoolGame({super.key});

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

  bool _devMode = false;
  Key _gameKey = GlobalKey();

  @override
  Widget build(BuildContext context) => BonfireWidget(
        key: _gameKey,
        debugMode: _devMode,
        showCollisionArea: _devMode,
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
        cameraConfig: _cameraConfig,
        player: DwarfWarrior(
          position: Vector2.all(20),
          toggleDevMode: _toggleDevMode,
        ),
        onReady: _onReady,
        map: WorldMapBySpritefusion(
          WorldMapReader.fromAsset(Globals.map),
          objectsBuilder: {
            'Alchemist': (properties) => Alchemist(
                  position: properties,
                ),
            'Blacksmith': (properties) => Blacksmith(
                  position: properties,
                ),
            'Lizardman': (properties) => Lizardman(
                  position: properties,
                ),
            'Minotaur': (properties) => Minotaur(
                  position: properties,
                ),
            'Headless Horseman': (properties) => HeadlessHorseman(
                  position: properties,
                ),
          },
        ),
      );

  void _toggleDevMode() => setState(
        () {
          _devMode = !_devMode;
          _gameKey = UniqueKey();
        },
      );

  void _onReady(BonfireGameInterface i) =>
      debugPrint('"My Cool Game" is now ready. 👍🏾');
}
