import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:my_cool_game/globals.dart';
import 'package:my_cool_game/npcs/alchemist.dart';
import 'package:my_cool_game/npcs/blacksmith.dart';
import 'package:my_cool_game/players/dwarf_warrior.dart';

class MyCoolGame extends StatefulWidget {
  const MyCoolGame({super.key});

  @override
  State<MyCoolGame> createState() => _MyCoolGameState();
}

class _MyCoolGameState extends State<MyCoolGame> {
  final _cameraConfig = CameraConfig(
    initialMapZoomFit: InitialMapZoomFitEnum.fitHeight,
    moveOnlyMapArea: true,
  );

  final _keyboard = Keyboard(
    config: KeyboardConfig(
      enable: true,
    ),
  );

  void _onReady(BonfireGameInterface i) =>
      debugPrint('"My Cool Game" is now ready. 👍🏾');

  @override
  Widget build(BuildContext context) => BonfireWidget(
        playerControllers: [_keyboard],
        cameraConfig: _cameraConfig,
        player: DwarfWarrior(
          position: Vector2.all(20),
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
          },
        ),
      );
}
