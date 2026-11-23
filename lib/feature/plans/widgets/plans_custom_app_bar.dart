import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class PlansCustomAppBar extends StatelessWidget {
  const PlansCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: Notifications Bell
        IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
            color: ColorManager.textDark,
            size: 26,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('لا توجد إشعارات جديدة حالياً'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),

        // Center: App Logo
        Image.asset(AppAssets.fankoshLogo, height: 42, fit: BoxFit.contain),

        // Right: Profile Icon
        IconButton(
          icon: const Icon(
            Icons.account_circle_outlined,
            color: ColorManager.textDark,
            size: 28,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('صفحة الحساب الشخصي'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ],
    );
  }
}
