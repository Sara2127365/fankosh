import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class WalletPhoneInputBox extends StatelessWidget {
  final TextEditingController controller;

  const WalletPhoneInputBox({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'رقم الموبايل المرتبط بالمحفظة',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: ColorManager.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: ColorManager.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ColorManager.borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Checkmark indicator (green check)
              Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: ColorManager.greenLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 14,
                  color: ColorManager.greenSuccess,
                ),
              ),
              const SizedBox(width: 12),

              // Phone text input
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.textDark,
                    letterSpacing: 0.5,
                  ),
                  decoration: const InputDecoration(
                    hintText: '010 1234 5678',
                    hintStyle: TextStyle(
                      fontSize: 14.5,
                      color: ColorManager.textHint,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),

              // Mobile phone icon inside soft blue rounded box
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: ColorManager.blueLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.phone_android_rounded,
                  size: 20,
                  color: Color(0xFF3B82F6),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(
              Icons.info_outline_rounded,
              size: 14,
              color: ColorManager.textMuted,
            ),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                'اكتب الرقم المسجل عليه محفظتك لتلقي إشعار التأكيد.',
                style: TextStyle(
                  fontSize: 11.5,
                  color: ColorManager.textMuted,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
