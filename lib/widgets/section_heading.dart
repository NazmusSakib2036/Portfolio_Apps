import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool center;

  const SectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
    this.center = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          subtitle.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: AppTheme.accentBlue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: center ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryText,
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
