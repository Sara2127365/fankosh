import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class SettingsTileItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? iconBgColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  const SettingsTileItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconBgColor,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Icon Container (Right side in RTL)
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: iconBgColor ?? ColorManager.cardBackgroundLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 20,
                color: iconColor ?? ColorManager.textCharcoal,
              ),
            ),

            const SizedBox(width: 14),

            // Title & Subtitle (Middle)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorManager.textMuted,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Chevron arrow (Left side in RTL)
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 13,
              color: Color(0xFFD0D5DD),
            ),
          ],
        ),
      ),
    );
  }
}
