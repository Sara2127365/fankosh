import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/plans/models/plan_model.dart';
import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  final PlanModel plan;

  const OrderSummaryCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColorManager.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header with Receipt icon
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: ColorManager.dividerColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.receipt_long_outlined,
                  size: 18,
                  color: ColorManager.textMuted,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'ملخص الطلب',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textDark,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Plan Name Row
          _buildRow('الباقة المختارة', plan.title, isBold: true),
          const SizedBox(height: 10),

          // Attempts Row
          _buildRow('عدد المحاولات', '${plan.attempts} محاولة'),
          const SizedBox(height: 10),

          // Validity Row
          _buildRow('مدة الصلاحية', '30 يوم'),
          const SizedBox(height: 10),

          // Plan Features
          _buildRow('المميزات', plan.perkText),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(color: ColorManager.dividerColor, height: 1),
          ),

          // Total Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'الإجمالي للدفع',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textDark,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: ColorManager.fontFamily),
                  children: [
                    TextSpan(
                      text: '${plan.price} ',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.goldAmber,
                      ),
                    ),
                    const TextSpan(
                      text: 'جنيه',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.textDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13.5,
            color: ColorManager.textMuted,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: ColorManager.textDark,
          ),
        ),
      ],
    );
  }
}
