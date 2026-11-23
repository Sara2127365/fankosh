import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/plans/models/plan_model.dart';
import 'package:flutter/material.dart';

class SelectedPlanSummaryBanner extends StatelessWidget {
  final PlanModel plan;
  final VoidCallback? onChangePlan;

  const SelectedPlanSummaryBanner({
    super.key,
    required this.plan,
    this.onChangePlan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Right side in RTL: Plan name and attempts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${plan.attempts} محاولة • 30 يوم',
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorManager.textMuted,
                ),
              ),
            ],
          ),

          // Left side in RTL: Price and Change plan button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${plan.price} جنيه',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textDark,
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: onChangePlan ?? () => Navigator.pop(context),
                child: const Text(
                  'تغيير الباقة',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.blueLink,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
