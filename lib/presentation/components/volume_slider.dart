import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VolumeSlider extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;
  final IconData icon;
  final bool isMuted;
  final VoidCallback onMutePressed;

  const VolumeSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.icon,
    required this.isMuted,
    required this.onMutePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onMutePressed,
              icon: Icon(
                isMuted ? Icons.volume_off : icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const Gap(8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
        const Gap(8),
        Row(
          children: [
            Expanded(
              child: SliderTheme(
                data: const SliderThemeData(
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                ),
                child: Slider(
                  value: value,
                  onChanged: onChanged,
                  min: 0.0,
                  max: 1.0,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                '${(value * 100).round()}%',
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
