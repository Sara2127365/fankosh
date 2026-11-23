import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class LogoutTileButton extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutTileButton({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onLogout,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: ColorManager.cardBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorManager.borderLight),
        ),
        child: Row(
          children: [
            // Logout Icon container (Right in RTL)
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFFEE4E2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.logout_rounded,
                size: 20,
                color: Color(0xFFD92D20),
              ),
            ),
            const SizedBox(width: 14),
            const Text(
              'تسجيل الخروج',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD92D20),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 13,
              color: Color(0xFFF97066),
            ),
          ],
        ),
      ),
    );
  }
}
