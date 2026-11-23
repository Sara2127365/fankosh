import 'dart:io';
import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String? imagePath;
  final VoidCallback onEdit;

  const UserProfileCard({
    super.key,
    required this.name,
    required this.email,
    this.imagePath,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManager.borderLight),
      ),
      child: Row(
        children: [
          // Avatar (Right in RTL)
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: Color(0xFFD8EAFF),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: imagePath != null
                  ? Image.file(
                      File(imagePath!),
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppAssets.userAvatar,
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          const SizedBox(width: 14),

          // Name & Email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: ColorManager.textDark,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: ColorManager.textMuted,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Edit Yellow Tag (Left in RTL)
          GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: ColorManager.badgeYellowBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit_outlined, size: 14, color: ColorManager.amberDark),
                  SizedBox(width: 4),
                  Text(
                    'تعديل',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.amberDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
