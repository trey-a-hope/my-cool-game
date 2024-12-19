import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_cool_game/presentation/components/adventure_style_text.dart';

class OverlayContainer extends StatelessWidget {
  final String? title;
  final void Function()? onClose;
  final Widget child;

  const OverlayContainer({
    this.title,
    this.onClose,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      color: Colors.transparent,
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Container(
            width: size.width * 0.8,
            height: size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (title != null) ...[
                      AdventureStyleText(
                        title!,
                        fontSizeMultiplier: 0.01,
                      )
                    ],
                    if (onClose != null) ...[
                      IconButton(
                        onPressed: onClose,
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ],
                ),
                const Gap(16),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
