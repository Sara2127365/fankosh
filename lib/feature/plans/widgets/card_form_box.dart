import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class CardFormBox extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryController;
  final TextEditingController cvvController;
  final TextEditingController holderNameController;

  const CardFormBox({
    super.key,
    required this.cardNumberController,
    required this.expiryController,
    required this.cvvController,
    required this.holderNameController,
  });

  Widget _buildField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: ColorManager.textDark,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: ColorManager.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorManager.borderColor),
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  obscureText: obscureText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorManager.textDark,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 13.5,
                      color: ColorManager.textHint,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Icon(
                prefixIcon,
                size: 20,
                color: ColorManager.textMuted,
              ),
              const SizedBox(width: 14),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColorManager.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with credit card icon
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: ColorManager.cardOrangeBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.credit_card_rounded,
                  color: ColorManager.cardOrange,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'بيانات البطاقة',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textDark,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Card Number
          _buildField(
            label: 'رقم البطاقة',
            hintText: '1234 5678 9012 3456',
            controller: cardNumberController,
            prefixIcon: Icons.credit_card_outlined,
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 14),

          // Expiry and CVV Row
          Row(
            children: [
              Expanded(
                child: _buildField(
                  label: 'تاريخ الانتهاء',
                  hintText: 'MM/YY',
                  controller: expiryController,
                  prefixIcon: Icons.calendar_today_outlined,
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildField(
                  label: 'الرمز الأمني CVV',
                  hintText: '•••',
                  controller: cvvController,
                  prefixIcon: Icons.lock_outline_rounded,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Cardholder Name
          _buildField(
            label: 'اسم صاحب البطاقة',
            hintText: 'AHMED MOHAMED',
            controller: holderNameController,
            prefixIcon: Icons.person_outline_rounded,
          ),
        ],
      ),
    );
  }
}
