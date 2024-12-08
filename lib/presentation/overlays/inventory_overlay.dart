import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cool_game/data/services/modal_service.dart';
import 'package:my_cool_game/domain/core/extensions/game_component_extensions.dart';
import 'package:my_cool_game/domain/core/globals.dart';
import 'package:my_cool_game/domain/core/providers.dart';
import 'package:my_cool_game/presentation/overlays/overlay_container.dart';
import 'package:toastification/toastification.dart';

class InventoryOverlay extends ConsumerWidget {
  final Player? player;
  final void Function() onClose;

  const InventoryOverlay({
    super.key,
    required this.player,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.read(Providers.inventoryProvider);
    final inventoryNotifier = ref.read(Providers.inventoryProvider.notifier);

    return OverlayContainer(
      title: 'Inventory',
      onClose: onClose,
      child: inventory.isEmpty
          ? Center(
              child: Text(
                'No Items',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.white),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                mainAxisSpacing: 8,
                crossAxisSpacing: 64,
              ),
              itemCount: inventory.length,
              itemBuilder: (context, index) {
                final item = inventory[index];

                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (player == null ||
                            (item.id != 'potion' && item.id != 'gem')) return;

                        final confirm = await ModalService.showConfirmation(
                          title: 'Use ${item.name}',
                          message: 'Are you sure?',
                          context: context,
                        );

                        if (confirm == null || confirm == false) return;

                        inventoryNotifier.removeItem(item.id);

                        final icon = Image.asset(
                          'assets/images/${item.spritePath}',
                          width: Globals.tileSize,
                          height: Globals.tileSize,
                        );

                        switch (item.id) {
                          case 'potion':
                            ModalService.showToast(
                              title: '25 HP Replenished',
                              type: ToastificationType.success,
                              icon: icon,
                            );
                            player!.playSoundEffect(Globals.audio.potion, ref);
                            player!.addLife(25);
                            break;
                          case 'gem':
                            ModalService.showToast(
                              title: 'All HP Replenished',
                              type: ToastificationType.success,
                              icon: icon,
                            );
                            player!.playSoundEffect(Globals.audio.gem, ref);
                            player!.addLife(100);
                            break;
                        }

                        onClose();
                      },
                      child: SpriteWidget.asset(
                        path: item.spritePath,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black54,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 4,
                        ),
                        child: Text(
                          '${item.quantity}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
    );
  }
}
