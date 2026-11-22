import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double logoWidth;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.logoWidth = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/fankosh_logo.png',
            width: logoWidth,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E2833),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF7E8A9A),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
