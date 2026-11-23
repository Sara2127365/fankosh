import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';

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
            AppAssets.fankoshLogo,
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
            color: ColorManager.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: ColorManager.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
