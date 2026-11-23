import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/plans/models/plan_model.dart';
import 'package:flutter/material.dart';

class PlanCardWidget extends StatelessWidget {
  final PlanModel plan;
  final VoidCallback onSelect;

  const PlanCardWidget({
    super.key,
    required this.plan,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = plan.borderColor ?? ColorManager.borderAlt;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: borderColor,
          width: plan.isPopular || plan.id == 'lite' ? 1.5 : 1.0,
        ),
        boxShadow: plan.isPopular
            ? [
                BoxShadow(
                  color: ColorManager.primaryColor.withValues(alpha: 0.16),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (plan.topBadge != null) const SizedBox(height: 8),

                // Title, Badge, and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title and badge
                    Row(
                      children: [
                        Text(
                          plan.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textDark,
                          ),
                        ),
                        if (plan.badge != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: plan.id == 'lite'
                                  ? ColorManager.blueLight
                                  : ColorManager.dividerColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              plan.badge!,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: plan.id == 'lite'
                                    ? ColorManager.blueLink
                                    : ColorManager.textMuted,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),

                    // Price
                    Row(
                      children: [
                        Text(
                          '${plan.price}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: plan.priceColor ?? ColorManager.textDark,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'جنيه',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: plan.priceColor ?? ColorManager.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Duration / Attempts
                Text(
                  plan.durationText,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF7E8A9A),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 16),

                // Bottom Action & Perk Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Action button on left in RTL
                    if (plan.isCurrentPlan)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.buttonUnSelected,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'باقتك الحالية',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textSub,
                          ),
                        ),
                      )
                    else if (plan.isPopular)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primaryColor,
                          foregroundColor: ColorManager.textDark,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: onSelect,
                        child: const Text(
                          'اختار الباقة',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textDark,
                          ),
                        ),
                      )
                    else
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: ColorManager.blueLink,
                          side: const BorderSide(
                            color: ColorManager.blueLink,
                            width: 1.5,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: onSelect,
                        child: const Text(
                          'اختار الباقة',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.blueLink,
                          ),
                        ),
                      ),

                    // Perk text on right
                    Flexible(
                      child: Text(
                        plan.perkText,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                          color: plan.isPopular
                              ? ColorManager.goldAmber
                              : ColorManager.textMuted,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Top-right Amber Ribbon for Popular
          if (plan.topBadge != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: const BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 13,
                      color: ColorManager.textDark,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      plan.topBadge!,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.textDark,
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
