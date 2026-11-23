import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class SecurityGuaranteeCard extends StatelessWidget {
  const SecurityGuaranteeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: ColorManager.cardBackgroundLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.borderColor),
      ),
      child: Row(
        children: [
          // Security Lock Icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: ColorManager.primaryColor.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.lock_outline_rounded,
              color: Color(0xFFB57E00),
              size: 22,
            ),
          ),

          const SizedBox(width: 12),

          // Text details
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'دفع آمن ومشفّر 100%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'تأكيد فوري دون انتظار ومتابعة فورية لإفيهاتك المفضلة',
                  style: TextStyle(
                    fontSize: 11.5,
                    color: ColorManager.textMuted,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
