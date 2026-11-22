import 'package:flutter/material.dart';

class OnboardingTitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final double highlightWidth;

  const OnboardingTitleSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.highlightWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 2,
              child: Container(
                height: 10,
                width: highlightWidth,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD54F).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E2833),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Color(0xFF7E8A9A),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
