import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_cool_game/domain/entities/npcs/alchemist.dart';
import 'package:my_cool_game/presentation/components/adventure_style_text.dart';
import 'package:my_cool_game/presentation/overlays/overlay_container.dart';

class StartOverlay extends StatelessWidget {
  final void Function() onStart;

  static const _images = 'assets/images/';

  final dwarf = Image.asset(
    '${_images}dwarf_warrior/idle/0.png',
    scale: 0.3,
  );

  final alchemist = Image.asset(
    '${_images}alchemist/0.png',
    scale: 0.5,
  );

  final blacksmith = Image.asset(
    '${_images}blacksmith/0.png',
    scale: 0.5,
  );

  StartOverlay({
    required this.onStart,
    super.key,
  });

  @override
  Widget build(BuildContext context) => OverlayContainer(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blueAccent.shade100,
                  Colors.blueAccent.shade700,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [dwarf, alchemist, blacksmith],
              ),
              const AdventureStyleText(
                title: 'My Cool Game',
              ),
              const Gap(32),
              ElevatedButton(
                onPressed: onStart,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Start',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            ],
          ),
        ],
      ));
}
