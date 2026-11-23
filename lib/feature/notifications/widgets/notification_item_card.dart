import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class NotificationItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isUnread;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const NotificationItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isUnread = false,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.borderLight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side: Time and optional Unread Dot
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorManager.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isUnread) ...[
                const SizedBox(height: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: ColorManager.unreadRed,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),

          const SizedBox(width: 12),

          // Middle: Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: ColorManager.textMuted,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Right side: Icon Container
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
