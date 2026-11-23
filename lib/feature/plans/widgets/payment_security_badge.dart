import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class PaymentSecurityBadge extends StatelessWidget {
  const PaymentSecurityBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: ColorManager.cardBackgroundLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.borderLight),
      ),
      child: Row(
        children: [
          // Shield check icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: ColorManager.greenLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: ColorManager.greenSuccess,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          // Texts
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'دفع آمن ومشفّر',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'نستخدم أعلى معايير الأمان لحماية بياناتك',
                  style: TextStyle(
                    fontSize: 11.5,
                    color: ColorManager.textMuted,
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
