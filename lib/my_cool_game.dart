import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:my_cool_game/globals.dart';

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

  @override
  Widget build(BuildContext context) => BonfireWidget(
        playerControllers: [_keyboard],
        cameraConfig: _cameraConfig,
        map: WorldMapBySpritefusion(
          WorldMapReader.fromAsset(Globals.map),
        ),
      );
}
