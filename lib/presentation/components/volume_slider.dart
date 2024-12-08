import 'package:flutter/material.dart';

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
              icon: Icon(
                isMuted ? Icons.volume_off : icon,
                color: Colors.white.withOpacity(0.9),
                size: 20,
              ),
              onPressed: onMutePressed,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: Colors.white.withOpacity(0.8),
                  inactiveTrackColor: Colors.white.withOpacity(0.2),
                  thumbColor: Colors.white,
                  trackHeight: 4,
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
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
